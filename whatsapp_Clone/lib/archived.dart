import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Archived extends StatefulWidget {
  const Archived({super.key});

  @override
  State<Archived> createState() => _ArchivedState();
}

class _ArchivedState extends State<Archived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 52, 67, 1),
      appBar: AppBar(
        title: Text(
          'Archived',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(39, 52, 67, 1),
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: Text(
                    'Archived Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ];
            },
            color: Color.fromRGBO(39, 52, 67, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'These Chats stay archived when new messages are received.',
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 0,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('Y'),
                      ),
                      title: Text(
                        'You',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'hi',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        '12:32',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Divider(
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
