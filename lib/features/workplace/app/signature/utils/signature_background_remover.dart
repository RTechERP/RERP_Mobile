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
    int minComponentSize = 3,
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
    // 1. Extract alpha from brightness
    // ------------------------------------------------------------

    for (int y = 0; y < source.height; y++) {
      for (int x = 0; x < source.width; x++) {
        final pixel = source.getPixel(x, y);

        final r = pixel.r.toDouble();
        final g = pixel.g.toDouble();
        final b = pixel.b.toDouble();

        // Perceived brightness.
        final brightness =
            0.299 * r +
            0.587 * g +
            0.114 * b;

        int alpha;

        if (brightness >= threshold) {
          // White / near-white background.
          alpha = 0;
        } else if (brightness <= blackPoint) {
          // Dark signature.
          alpha = 255;
        } else {
          // Soft alpha for anti-aliased edges.
          final value =
              (threshold - brightness) /
              (threshold - blackPoint);

          alpha = (value * 255)
              .clamp(0, 255)
              .round();
        }

        if (alpha == 0) {
          image.setPixelRgba(
            x,
            y,
            255,
            255,
            255,
            0,
          );
        } else {
          image.setPixelRgba(
            x,
            y,
            r.round(),
            g.round(),
            b.round(),
            alpha,
          );
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
