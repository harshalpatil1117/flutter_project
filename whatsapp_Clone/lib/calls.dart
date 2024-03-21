import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => CallsState();
}

class CallsState extends State<Calls> {

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Calls',
        style: TextStyle(color: Colors.white,fontSize: 30),
      ),
    );
  }
}
