import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class EmiDialWidget extends StatefulWidget {
  const EmiDialWidget({super.key});

  @override
  State<EmiDialWidget> createState() => _EmiDialWidgetState();
}

class _EmiDialWidgetState extends State<EmiDialWidget> {
  double _currentAngle = 0.0;
  int _emiCount = 0;
  final double _maxAngle = math.pi * 1.5;

  void _updateAngle(double angle) {
    setState(() {
      _currentAngle = angle;
      _emiCount = ((angle / _maxAngle) * 90).round();
    });
  }

  void _incrementEmi() {
    if (_emiCount < 90) {
      setState(() {
        _emiCount++;
        _currentAngle = (_emiCount / 90) * _maxAngle;
      });
    }
  }

  void _decrementEmi() {
    if (_emiCount > 0) {
      setState(() {
        _emiCount--;
        _currentAngle = (_emiCount / 90) * _maxAngle;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 350,
          height: 350,
          child: GestureDetector(
            onPanUpdate: (details) {
              final center = Offset(175, 175);
              final angle = math.atan2(
                details.localPosition.dy - center.dy,
                details.localPosition.dx - center.dx,
              );
              
              double dialAngle = angle - math.pi; 
              if (dialAngle < 0) dialAngle += 2 * math.pi;
              
              double normalizedAngle = dialAngle;
              if (normalizedAngle > _maxAngle) {
                normalizedAngle = _maxAngle;
              }
              
              _updateAngle(normalizedAngle);
            },
            child: CustomPaint(
              painter: EmiDialPainter(
                currentAngle: _currentAngle,
                emiCount: _emiCount,
              ),
            ),
          ),
        ),
        
        Positioned(
          bottom: 75,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _decrementEmi,
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Color(0xFF00BCD4),
                  size: 20,
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: 1,
                height: 16,
                color: AppPalette.greenColor,
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: _incrementEmi,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppPalette.greenColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EmiDialPainter extends CustomPainter {
  final double currentAngle;
  final int emiCount;
  final double maxAngle = math.pi * 1.5; 

  EmiDialPainter({required this.currentAngle, required this.emiCount});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2 - 40;
    final trackRadius = outerRadius - 17;

    final startAngle = math.pi; 

    final trackPaint = Paint()
      ..color = Color(0xFF6B7280)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: trackRadius),
      startAngle,
      maxAngle,
      false,
      trackPaint,
    );

    final progressPaint = Paint()
      ..color = AppPalette.greenColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40
      ..strokeCap = StrokeCap.round;

    if (currentAngle > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: trackRadius),
        startAngle,
        currentAngle,
        false,
        progressPaint,
      );
    }

    for (int i = 0; i <= 90; i++) {
      final tickAngle = startAngle + (i / 90) * maxAngle;
      final isMainTick = i % 15 == 0;
      final isMidTick = i % 5 == 0;
      
      double tickLength;
      double tickWidth;
      Color tickColor;
      
      if (isMainTick) {
        tickLength = 12.0;
        tickWidth = 2.0;
        tickColor = Colors.white;
      } else if (isMidTick) {
        tickLength = 8.0;
        tickWidth = 1.5;
        tickColor = Colors.white70;
      } else {
        tickLength = 4.0;
        tickWidth = 1.0;
        tickColor = Colors.white54;
      }
      
      final startRadius = trackRadius - 40;
      final endRadius = startRadius + tickLength;
      
      final startX = center.dx + startRadius * math.cos(tickAngle);
      final startY = center.dy + startRadius * math.sin(tickAngle);
      final endX = center.dx + endRadius * math.cos(tickAngle);
      final endY = center.dy + endRadius * math.sin(tickAngle);

      final tickPaint = Paint()
        ..color = tickColor
        ..strokeWidth = tickWidth
        ..strokeCap = StrokeCap.round;
      
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }

    final labelData = [
      {'number': 30, 'angle': math.pi}, 
      {'number': 60, 'angle': math.pi * 1.5}, 
      {'number': 90, 'angle': 0.0}, 
    ];
    
    for (final data in labelData) {
      final number = data['number'] as int;
      final labelAngle = data['angle'] as double;
      final labelRadius = outerRadius + 30;
      
      final labelX = center.dx + labelRadius * math.cos(labelAngle);
      final labelY = center.dy + labelRadius * math.sin(labelAngle);
      
      final textPainter = TextPainter(
        text: TextSpan(
          text: number.toString(),
          style: TextStyle(
            color: AppPalette.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          labelX - textPainter.width / 2,
          labelY - textPainter.height / 2,
        ),
      );
    }

    final innerRingPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 70, innerRingPaint);

  
    final innerCirclePaint = Paint()
      ..color = AppPalette.greenColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 55, innerCirclePaint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: emiCount.toString().padLeft(2, '0'),
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          fontFamily: 'monospace',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );

    final handleAngle = startAngle + currentAngle;
    final handleX = center.dx + trackRadius * math.cos(handleAngle);
    final handleY = center.dy + trackRadius * math.sin(handleAngle);
    
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: .2)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(handleX + 1, handleY + 1), 22, shadowPaint);
    
    final handlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(handleX, handleY), 24, handlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}