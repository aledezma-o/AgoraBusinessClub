import 'package:flutter/material.dart';

class HorizontalDraggableWidget extends StatefulWidget {
  final Widget child;

  HorizontalDraggableWidget({required this.child});

  @override
  _HorizontalDraggableWidgetState createState() =>
      _HorizontalDraggableWidgetState();
}

class _HorizontalDraggableWidgetState extends State<HorizontalDraggableWidget> {
  double _dx = 0.0;
  double _startDx = 0.0;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onHorizontalDragStart: (DragStartDetails details) {
          _startDx = details.globalPosition.dx;
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          double dx = details.globalPosition.dx - _startDx;
          setState(() {
            _dx = dx;
          });
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          _startDx = 0.0;
          _dx = 0.0;
        },
        child: Transform.translate(
          offset: Offset(_dx, 0.0),
          child: widget.child,
        ),
    );
  }
}
