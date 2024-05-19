
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr/qr.dart';


class Qr extends StatelessWidget {
  late QrImage _qrImage;
  final String content;
  final double? size;
  Qr({Key? key, required this.content, this.size,}) : super(key: key){
    final qrCode = QrCode(4, QrErrorCorrectLevel.L)..addData(content);
    _qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: QrPainter(
        size: size,
        qrImage: _qrImage
      ),
    );
  }
}

class QrPainter extends CustomPainter{
  final double? size;
  final QrImage qrImage;

  @override
  void paint(Canvas canvas, Size size) {
    final pixelWidth = this.size ?? size.width / qrImage.moduleCount;
    final blackBrush = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = pixelWidth
        ..color = KColors.black;

    final whiteBrush = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = pixelWidth
      ..color = KColors.white;

    for (var x = 0; x < qrImage.moduleCount; x++) {
      for (var y = 0; y < qrImage.moduleCount; y++) {
        canvas.drawRect(Rect.fromLTWH(2 + x.toDouble()*pixelWidth, 2 + y.toDouble()*pixelWidth, 1, 1), qrImage.isDark(y, x) ? blackBrush : whiteBrush);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  const QrPainter({
    required this.qrImage,
    required this.size
  });
}