import 'dart:typed_data';
import 'package:image/image.dart' as img;

class SignatureProcessResult {
  final Uint8List pngBytes;
  final int width;
  final int height;

  const SignatureProcessResult({
    required this.pngBytes,
    required this.width,
    required this.height,
  });
}

class SignatureImageHelper {
  SignatureImageHelper._();

  /// Remove white background from a signature image.
  ///
  /// [threshold]
  /// Higher = remove more light pixels.
  /// Recommended: 220 - 245
  ///
  /// [blackPoint]
  /// Pixels darker than this become fully opaque.
  ///
  /// [padding]
  /// Padding added around the cropped signature.
  ///
  /// [removeNoise]
  /// Remove small isolated pixels.
  ///
  /// [outputWidth]
  /// Optional output width. Height is calculated automatically.
  static SignatureProcessResult process(
    Uint8List inputBytes, {
    int threshold = 235,
    int blackPoint = 100,
    int padding = 10,
    bool removeNoise = true,
    int minComponentSize = 2,
    int? outputWidth,
  }) {
    final source = img.decodeImage(inputBytes);

    if (source == null) {
      throw ArgumentError('Invalid image data');
    }

    final image = img.Image(
      width: source.width,
      height: source.height,
      numChannels: 4,
    );

    // ------------------------------------------------------------
    // 1. Estimate background color from image corners.
    //    The signature is normally centered; corners are clean paper
    //    or shadow background. Using the median sample keeps us safe
    //    from one shadowed corner pulling the estimate.
    // ------------------------------------------------------------

    final bg = _sampleBackground(source);

    // ------------------------------------------------------------
    // 2. Compute alpha using darkness-from-paper test.
    //
    //    Heuristic for signature on paper:
    //      - Ink       : much darker than paper (luminance << bg).
    //      - Paper     : luminance ~ paper luminance.
    //      - Shadow    : slightly darker than paper, but still close.
    //
    //    We pick a darkness cutoff that puts shadow on the
    //    background side and ink on the opaque side.
    // ------------------------------------------------------------

    final bgLuminance = bg.luminance;

    // Pick a darkness threshold. Paper brightness is sampled from
    // corners; real ink usually sits at least 60 units darker than
    // the paper, while shadows are within ~40 units. Anything
    // between gets a soft fade.
    const darknessSolid = 70.0; // >= this => full ink
    const darknessFade = 35.0; // <= this => background

    for (int y = 0; y < source.height; y++) {
      for (int x = 0; x < source.width; x++) {
        final pixel = source.getPixel(x, y);

        final r = pixel.r.toDouble();
        final g = pixel.g.toDouble();
        final b = pixel.b.toDouble();

        final luminance =
            0.299 * r + 0.587 * g + 0.114 * b;

        final darkness = bgLuminance - luminance;

        int alpha;
        if (darkness >= darknessSolid) {
          alpha = 255;
        } else if (darkness <= darknessFade) {
          alpha = 0;
        } else {
          final t = (darkness - darknessFade) /
              (darknessSolid - darknessFade);
          alpha = (t * 255).clamp(0, 255).round();
        }

        if (alpha == 0) {
          image.setPixelRgba(x, y, 0, 0, 0, 0);
        } else {
          // Normalize RGB against the background so the ink comes
          // out clean (no paper tint bleeding into the dark pixels).
          final nr = (r - bg.r * (1 - alpha / 255.0))
              .clamp(0, 255)
              .round();
          final ng = (g - bg.g * (1 - alpha / 255.0))
              .clamp(0, 255)
              .round();
          final nb = (b - bg.b * (1 - alpha / 255.0))
              .clamp(0, 255)
              .round();

          image.setPixelRgba(x, y, nr, ng, nb, alpha);
        }
      }
    }

    // ------------------------------------------------------------
    // 2. Remove tiny noise
    // ------------------------------------------------------------

    if (removeNoise) {
      _removeNoise(
        image,
        minComponentSize: minComponentSize,
      );
    }

    // ------------------------------------------------------------
    // 3. Find signature bounding box
    // ------------------------------------------------------------

    final bounds = _findBounds(image);

    if (bounds == null) {
      throw StateError(
        'No signature detected in image',
      );
    }

    // ------------------------------------------------------------
    // 4. Crop signature
    // ------------------------------------------------------------

    final cropped = img.copyCrop(
      image,
      x: (bounds.left - padding).clamp(
        0,
        image.width - 1,
      ),
      y: (bounds.top - padding).clamp(
        0,
        image.height - 1,
      ),
      width: (
        bounds.width +
        padding * 2
      ).clamp(
        1,
        image.width -
            (bounds.left - padding).clamp(
              0,
              image.width - 1,
            ),
      ),
      height: (
        bounds.height +
        padding * 2
      ).clamp(
        1,
        image.height -
            (bounds.top - padding).clamp(
              0,
              image.height - 1,
            ),
      ),
    );

    // ------------------------------------------------------------
    // 5. Optional resize
    // ------------------------------------------------------------

    final output = outputWidth != null &&
            outputWidth > 0 &&
            cropped.width != outputWidth
        ? img.copyResize(
            cropped,
            width: outputWidth,
            maintainAspect: true,
            interpolation: img.Interpolation.cubic,
          )
        : cropped;

    // ------------------------------------------------------------
    // 6. Encode PNG
    // ------------------------------------------------------------

    final pngBytes = Uint8List.fromList(
      img.encodePng(output),
    );

    return SignatureProcessResult(
      pngBytes: pngBytes,
      width: output.width,
      height: output.height,
    );
  }

// ============================================================
// Background Sampling
// ============================================================

/// Sample the dominant background color by averaging a ring of pixels
/// near each corner. Returns a clean estimate of paper color,
/// including any tint (yellowish, grayish) or shadow.
///
/// We avoid a single median because shadow at one corner would
/// skew the estimate badly. Multi-corner + center-ish sampling
/// gives a robust paper color.
static _Color _sampleBackground(img.Image image) {
  const int size = 12; // patch size around the sample point

  final samples = <_Color>[];

  void addPatch(int cx, int cy) {
    double r = 0, g = 0, b = 0;
    int n = 0;
    for (int dy = -size; dy <= size; dy++) {
      for (int dx = -size; dx <= size; dx++) {
        final x = (cx + dx).clamp(0, image.width - 1);
        final y = (cy + dy).clamp(0, image.height - 1);
        final p = image.getPixel(x, y);
        r += p.r;
        g += p.g;
        b += p.b;
        n++;
      }
    }
    samples.add(
      _Color(r / n, g / n, b / n),
    );
  }

  // Four corners.
  addPatch(0, 0);
  addPatch(image.width - 1, 0);
  addPatch(0, image.height - 1);
  addPatch(image.width - 1, image.height - 1);

  // Mid-edges (less likely to be the signature).
  addPatch(image.width ~/ 2, 4);
  addPatch(image.width ~/ 2, image.height - 5);

  // Median by luminance -> picks the "background-ish" patches over
  // the shadow patch.
  samples.sort(
    (a, b) => a.luminance.compareTo(b.luminance),
  );
  final median =
      samples[samples.length ~/ 2];

  return median;
}

// ============================================================
// Bounding Box
// ============================================================

  static _Bounds? _findBounds(img.Image image) {
    int? minX;
    int? minY;
    int? maxX;
    int? maxY;

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);

        if (pixel.a > 20) {
          minX = minX == null
              ? x
              : x < minX
                  ? x
                  : minX;

          minY = minY == null
              ? y
              : y < minY
                  ? y
                  : minY;

          maxX = maxX == null
              ? x
              : x > maxX
                  ? x
                  : maxX;

          maxY = maxY == null
              ? y
              : y > maxY
                  ? y
                  : maxY;
        }
      }
    }

    if (minX == null ||
        minY == null ||
        maxX == null ||
        maxY == null) {
      return null;
    }

    return _Bounds(
      left: minX,
      top: minY,
      right: maxX,
      bottom: maxY,
    );
  }

  // ============================================================
  // Noise Removal
  // ============================================================

  static void _removeNoise(
    img.Image image, {
    int minComponentSize = 3,
  }) {
    final width = image.width;
    final height = image.height;

    final visited = List.generate(
      height,
      (_) => List<bool>.filled(width, false),
    );

    const directions = [
      [-1, -1],
      [0, -1],
      [1, -1],
      [-1, 0],
      [1, 0],
      [-1, 1],
      [0, 1],
      [1, 1],
    ];

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (visited[y][x]) continue;

        final pixel = image.getPixel(x, y);

        if (pixel.a <= 20) {
          visited[y][x] = true;
          continue;
        }

        final component = <_Point>[];

        final queue = <_Point>[
          _Point(x, y),
        ];

        visited[y][x] = true;

        while (queue.isNotEmpty) {
          final current = queue.removeLast();

          component.add(current);

          for (final direction in directions) {
            final nx = current.x + direction[0];
            final ny = current.y + direction[1];

            if (nx < 0 ||
                ny < 0 ||
                nx >= width ||
                ny >= height) {
              continue;
            }

            if (visited[ny][nx]) continue;

            final nextPixel = image.getPixel(nx, ny);

            if (nextPixel.a <= 20) {
              visited[ny][nx] = true;
              continue;
            }

            visited[ny][nx] = true;

            queue.add(
              _Point(nx, ny),
            );
          }
        }

        // Remove small isolated components.
        if (component.length < minComponentSize) {
          for (final point in component) {
            image.setPixelRgba(
              point.x,
              point.y,
              255,
              255,
              255,
              0,
            );
          }
        }
      }
    }
  }
}

// ================================================================
// Internal models
// ================================================================

class _Color {
  final double r;
  final double g;
  final double b;

  const _Color(this.r, this.g, this.b);

  double get luminance =>
      0.299 * r + 0.587 * g + 0.114 * b;
}

class _Point {
  final int x;
  final int y;

  const _Point(
    this.x,
    this.y,
  );
}

class _Bounds {
  final int left;
  final int top;
  final int right;
  final int bottom;

  const _Bounds({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  int get width => right - left + 1;

  int get height => bottom - top + 1;
}
