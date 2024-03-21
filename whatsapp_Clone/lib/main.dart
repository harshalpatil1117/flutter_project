import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats.dart';
import 'package:whatsapp_clone/tools.dart';
import 'package:whatsapp_clone/updates.dart';

import 'archived.dart';
import 'calls.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Whatsapp clone',
      debugShowCheckedModeBanner: false,
      home: WhatsappClone(),
    );
  }
}

class WhatsappClone extends StatefulWidget {
  const WhatsappClone({super.key});

  @override
  State<WhatsappClone> createState() => _WhatsappCloneState();
}

class _WhatsappCloneState extends State<WhatsappClone> {
  int _selectedIndex = 0;

    List<Widget> widgetOptions = [
     const Chats(),
     const Calls(),
      const Updates(),
      const Tools(),
   ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white12,
      // backgroundColor: Colors.white,
      appBar:  AppBar(

        title: const Text(
          'WA Business',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(39, 52, 67, 1),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text(
                    'Advertise',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text(
                    'Business tools',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text(
                    'New group',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text(
                    'New Broadcast',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem(
                  value: 4,
                  child: Text(
                    'Communities',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem(
                  value: 5,
                  child: Text(
                    'Labels',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem(
                  value: 6,
                  child: Text(
                    'Linked devices',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem(
                  value: 7,
                  child: Text(
                    'Starred messages',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const PopupMenuItem(
                  value: 8,
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ];
            },
            color: const Color.fromRGBO(39, 52, 67, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
            backgroundColor: Color.fromRGBO(39, 52, 67, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
            backgroundColor: Color.fromRGBO(39, 52, 67, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
            backgroundColor: Color.fromRGBO(39, 52, 67, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: 'Tools',
            backgroundColor: Color.fromRGBO(39, 52, 67, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,

      ),

        body: widgetOptions[_selectedIndex],

    );
  }
}
