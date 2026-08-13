// Date: 12/08/2026
// Nội dung/Chức năng: Widget vẽ chữ ký với nét mượt

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SmoothSignaturePainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final Color penColor;
  final double strokeWidth;

  SmoothSignaturePainter({
    required this.strokes,
    this.penColor = Colors.black,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = penColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      if (stroke.isEmpty) continue;

      // Clip to bounds - filter points within canvas bounds
      final clippedPoints = stroke.map((p) {
        return Offset(
          p.dx.clamp(0, size.width),
          p.dy.clamp(0, size.height),
        );
      }).toList();

      // Skip if all points are outside bounds
      if (clippedPoints.every((p) => p.dx == 0 && p.dy == 0)) continue;

      if (clippedPoints.length == 1) {
        canvas.drawCircle(clippedPoints.first, strokeWidth / 2, paint..style = PaintingStyle.fill);
        paint.style = PaintingStyle.stroke;
        continue;
      }

      if (clippedPoints.length == 2) {
        canvas.drawLine(clippedPoints.first, clippedPoints.last, paint);
        continue;
      }

      final path = Path();
      path.moveTo(clippedPoints.first.dx, clippedPoints.first.dy);

      for (int i = 0; i < clippedPoints.length - 1; i++) {
        final p0 = clippedPoints[i];
        final p1 = clippedPoints[i + 1];

        final midX = (p0.dx + p1.dx) / 2;
        final midY = (p0.dy + p1.dy) / 2;

        path.quadraticBezierTo(p0.dx, p0.dy, midX, midY);
      }

      final lastPoint = clippedPoints.last;
      path.lineTo(lastPoint.dx, lastPoint.dy);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SmoothSignaturePainter oldDelegate) {
    return strokes != oldDelegate.strokes ||
        penColor != oldDelegate.penColor ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}

class SmoothSignatureCanvas extends StatefulWidget {
  final Color penColor;
  final double strokeWidth;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Function(ui.Image?)? onSignatureChanged;

  const SmoothSignatureCanvas({
    super.key,
    this.penColor = Colors.black,
    this.strokeWidth = 2.0,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.onSignatureChanged,
  });

  @override
  State<SmoothSignatureCanvas> createState() => SmoothSignatureCanvasState();
}

class SmoothSignatureCanvasState extends State<SmoothSignatureCanvas> {
  final List<List<Offset>> _strokes = [];
  List<Offset> _currentStroke = [];

  bool get isEmpty => _strokes.isEmpty && _currentStroke.isEmpty;

  void clear() {
    setState(() {
      _strokes.clear();
      _currentStroke.clear();
    });
    widget.onSignatureChanged?.call(null);
  }

  Future<ui.Image?> toImage({bool transparent = false}) async {
    if (isEmpty) return null;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final size = context.size ?? const Size(300, 150);

    if (!transparent) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = widget.backgroundColor,
      );
    }

    final painter = SmoothSignaturePainter(
      strokes: [..._strokes, if (_currentStroke.isNotEmpty) _currentStroke],
      penColor: widget.penColor,
      strokeWidth: widget.strokeWidth,
    );
    painter.paint(canvas, size);

    final picture = recorder.endRecording();
    return picture.toImage(size.width.toInt(), size.height.toInt());
  }

  Future<List<int>?> toPngBytes({bool transparent = false}) async {
    final image = await toImage(transparent: transparent);
    if (image == null) return null;

    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List().toList();
  }

  Future<Uint8List?> toTransparentBytes() async {
    final bytes = await toPngBytes(transparent: true);
    return bytes != null ? Uint8List.fromList(bytes) : null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onPanStart: (details) {
            final pos = details.localPosition;
            // Only start drawing if touch is within bounds
            if (pos.dx < 0 || pos.dx > constraints.maxWidth ||
                pos.dy < 0 || pos.dy > constraints.maxHeight) {
              return;
            }
            setState(() {
              _currentStroke = [pos];
            });
          },
          onPanUpdate: (details) {
            setState(() {
              _currentStroke.add(details.localPosition);
            });
          },
          onPanEnd: (details) {
            setState(() {
              _strokes.add(List.from(_currentStroke));
              _currentStroke.clear();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(color: widget.borderColor, width: widget.borderWidth),
            ),
            child: CustomPaint(
              painter: SmoothSignaturePainter(
                strokes: [..._strokes, if (_currentStroke.isNotEmpty) _currentStroke],
                penColor: widget.penColor,
                strokeWidth: widget.strokeWidth,
              ),
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
