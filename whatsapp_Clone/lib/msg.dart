import 'package:flutter/material.dart';

class Msg extends StatefulWidget {
  String name, circleAvatar;

  Msg({super.key, required this.name, required this.circleAvatar});

  @override
  State<Msg> createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  TextEditingController message = TextEditingController();
  List<String> chat = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(39, 52, 67, 1),
          title: Text(
            widget.name.toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  chat.clear();
                });
              },
            ),
          ],
        ),
        bottomSheet: Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                hintText: 'Enter Message',
                // hintStyle: TextStyle(color: Colors.white),
                isDense: true,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      chat.add(message.text);
                      message.clear();
                    });
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.green,
                    size: 35,
                  ),
                ),
              ),
              controller: message,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 75),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: chat.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Align(
                    alignment: index % 2 != 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Text(chat[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
