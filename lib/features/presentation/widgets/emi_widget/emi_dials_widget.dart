import 'package:firsteconomy/features/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class EmiDialWidget extends StatefulWidget {
  const EmiDialWidget({super.key});

  @override
  State<EmiDialWidget> createState() => _EmiDialWidgetState();
}

class _EmiDialWidgetState extends State<EmiDialWidget> {
  double _currentAngle = 0.0;
  final double _maxAngle = 2 * math.pi;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmiBloc, EmiState>(
      builder: (context, state) {
        return GestureDetector(
          onPanUpdate: (details) {
            final center = Offset(150, 150);
            final angle = math.atan2(
              details.localPosition.dy - center.dy,
              details.localPosition.dx - center.dx,
            );
            
            setState(() {
              _currentAngle = (angle + math.pi) % _maxAngle;
            });
            
            final emiCount = ((_currentAngle / _maxAngle) * 60).round();
            context.read<EmiBloc>().add(UpdateEmiCount(emiCount));
          },
          child: SizedBox(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: EmiDialPainter(
                currentAngle: _currentAngle,
                emiCount: state.emiCount,
              ),
            ),
          ),
        );
      },
    );
  }
}

class EmiDialPainter extends CustomPainter {
  final double currentAngle;
  final int emiCount;

  EmiDialPainter({required this.currentAngle, required this.emiCount});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;

    // Draw outer circle
    final outerPaint = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    canvas.drawCircle(center, radius, outerPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      currentAngle,
      false,
      progressPaint,
    );

    // Draw inner circle
    final innerPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 60, innerPaint);

    // Draw EMI count text
    final textPainter = TextPainter(
      text: TextSpan(
        text: emiCount.toString().padLeft(2, '0'),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
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

    // Draw handle
    final handleX = center.dx + radius * math.cos(currentAngle - math.pi / 2);
    final handleY = center.dy + radius * math.sin(currentAngle - math.pi / 2);
    final handlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(handleX, handleY), 15, handlePaint);

    // Draw tick marks
    for (int i = 0; i < 60; i++) {
      final tickAngle = (i / 60) * 2 * math.pi - math.pi / 2;
      final isMainTick = i % 10 == 0;
      final tickLength = isMainTick ? 15.0 : 8.0;
      final tickWidth = isMainTick ? 3.0 : 1.5;
      
      final startX = center.dx + (radius - 30) * math.cos(tickAngle);
      final startY = center.dy + (radius - 30) * math.sin(tickAngle);
      final endX = center.dx + (radius - 30 + tickLength) * math.cos(tickAngle);
      final endY = center.dy + (radius - 30 + tickLength) * math.sin(tickAngle);

      final tickPaint = Paint()
        ..color = Colors.white
        ..strokeWidth = tickWidth;
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}