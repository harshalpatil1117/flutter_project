import 'dart:math';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class DragDrop extends StatefulWidget {
  const DragDrop({super.key});

  @override
  State<DragDrop> createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  bool _isDropped = false;
  Color _color = Color(Random().nextInt(0xffffffff));
  Color color = Colors.black;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding.all(Dimensions.medium),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Draggable<Color>(
                  data: !_isDropped ? Colors.red :
                  _color,
                  child: Container(
                    color:
                    !_isDropped ? Colors.red :
                    _color,
                    width: 100,
                    height: 100,
                  ),
                  feedback: Container(
                    color:
                    !_isDropped ? Colors.red.withOpacity(0.5) :
                    _color,
                    width: 100,
                    height: 100,
                  ),
                ),
               SizedBox(height: MediaQuery.sizeOf(context).height/3,),
                DragTarget<Color>(
                  builder: (BuildContext context, accepted, rejected) {
                    return Container(
                      color: color,
                      width: 100,
                      height: 100,
                    );
                  },
                  onAccept: (Color data) {
                    setState(() {
                      _isDropped = true;
                      color = data;
                      _color = Color(Random().nextInt(0xffffffff));
                    });
                  },
                  onWillAccept: (data)  => true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

