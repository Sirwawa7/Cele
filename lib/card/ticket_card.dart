library ticket_card;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';


class TicketCard extends StatelessWidget {
  TicketCard({
    this.lineFromTop = 0,
    this.lineRadius = 10,
    required this.lineColor,
    required this.child,
    required this.decoration,
  });


  final double lineFromTop;


  final double lineRadius;

  final Widget child;


  final TicketDecoration decoration;


  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    SemiCircleClipper clipper = SemiCircleClipper(
      radius: lineRadius,
      fromTop: lineFromTop,
    );
    return CustomPaint(
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
      foregroundPainter: SeparatorPainter(clipper: clipper, fromTop: lineFromTop, radius: lineRadius, color: lineColor),
      painter: ShadowPainter(clipper: clipper, decoration: decoration),
    );
  }
}


class SemiCircleClipper extends CustomClipper<Path> {
  SemiCircleClipper({
    required this.fromTop,
    required this.radius,
  });


  final double fromTop;


  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path
      ..moveTo(0, 0)
      ..lineTo(0, max(fromTop - radius, 0))
      ..arcToPoint(Offset(radius, fromTop), clockwise: true, radius: Radius.circular(radius))
      ..arcToPoint(Offset(0, fromTop + radius), clockwise: true, radius: Radius.circular(radius))
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, fromTop + radius)
      ..arcToPoint(Offset(size.width - radius, fromTop), clockwise: true, radius: Radius.circular(radius))
      ..arcToPoint(Offset(size.width, max(fromTop - radius, 0)), radius: Radius.circular(radius))
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}


class ShadowPainter extends CustomPainter {
  TicketDecoration decoration;
  ShadowPainter({
    this.clipper,
    required this.decoration,
  }) : _decoration = decoration;

  final CustomClipper<Path>? clipper;

  final TicketDecoration? _decoration;

  TicketBorder get _border => _decoration?.border ?? TicketBorder(color: Colors.teal, width: 2, style: TicketBorderStyle.dotted);

  @override
  void paint(Canvas canvas, Size size) {
    if (_border.style == TicketBorderStyle.none) return;
    Paint paint = Paint()
      ..color = _border.color
      ..strokeWidth = _border.width
      ..style = PaintingStyle.stroke;
    Path path = clipper!.getClip(size);
    switch (_border.style) {
      case TicketBorderStyle.none:
        return;
      case TicketBorderStyle.solid:
        break;
      case TicketBorderStyle.dotted:
        path = dashPath(path, dashArray: CircularIntervalList<double>(<double>[5, 5]));
        break;
    }
    canvas.drawPath(path, paint);

    _decoration!.shadow.forEach((e) {
      canvas.drawShadow(clipper!.getClip(size), e.color ?? Colors.orange, e.elevation ?? 0, true);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class SeparatorPainter extends CustomPainter {
  SeparatorPainter({
    required this.clipper,
    required this.fromTop,
    required this.radius,
    required this.color,
  });
  CustomClipper<Path>? clipper;

  double radius;

  double fromTop;

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (fromTop == 0) return;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = Path()
      ..moveTo(radius + 5, fromTop)
      ..lineTo(size.width - radius - 5, fromTop);

    canvas.drawPath(dashPath(path, dashArray: CircularIntervalList<double>(<double>[5, 5])), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class TicketShadow {
  TicketShadow({
    this.color,
    this.elevation,
  });


  Color? color;


  double? elevation;
}


enum TicketBorderStyle { none, solid, dotted }

class TicketBorder {
  TicketBorder({
    required this.color,
    required this.width,
    required this.style,
  });
  final Color color;
  final double width;
  final TicketBorderStyle style;
}

class TicketDecoration {
  TicketDecoration({
    this.shadow = const [],
    this.border,
  });


  final List<TicketShadow> shadow;


  TicketBorder? border;
}
