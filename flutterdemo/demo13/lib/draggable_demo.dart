import 'package:flutter/material.dart';
import 'draggable_widget.dart';

class Draggabledemo extends StatefulWidget {
  @override
  _DraggabledemoState createState() => _DraggabledemoState();
}

class _DraggabledemoState extends State<Draggabledemo> {

  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DraggableWidget(offset: Offset(80, 80),widgetColor: Colors.tealAccent),
          DraggableWidget(offset: Offset(180, 80),widgetColor: Colors.redAccent),
          Center(
            child: DragTarget(
              onAccept: (Color color){
                _draggableColor = color;
              },
              builder: (context,candidateData,rejectedData){
                return Container(
                  width: 200,
                  height: 200,
                  color: _draggableColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
