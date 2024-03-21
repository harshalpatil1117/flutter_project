import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  const Tools({super.key});

  @override
  State<Tools> createState() => ToolsState();
}

class ToolsState extends State<Tools> {

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Tools',
        style: TextStyle(color: Colors.white,fontSize: 30),
      ),
    );
  }
}
