import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => UpdatesState();
}

class UpdatesState extends State<Updates> {

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Updates',
        style: TextStyle(color: Colors.white,fontSize: 30),
      ),
    );
  }
}
