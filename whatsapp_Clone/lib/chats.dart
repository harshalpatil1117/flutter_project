import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/archived.dart';
import 'package:whatsapp_clone/msg.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  List chatList = ['chat1','chat2','chat3','chat4','chat5','chat6','chat7'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>Archived()));
              },
              child: const ListTile(
                leading: Icon(Icons.archive,color: Colors.grey,),
                title: Text('Archived',style: TextStyle(color: Colors.white),),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: chatList.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${chatList[index].toString()[0]}${chatList[index].toString()[4]}".toUpperCase()),
                        ),
                        title: Text(chatList[index],style: TextStyle(color: Colors.white),),
                        subtitle: Text('Hii',style: TextStyle(color: Colors.white),),
                        trailing: Text('12:32',style: TextStyle(color: Colors.white),),
                      ),
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>Msg(name:chatList[index],circleAvatar:"${chatList[index].toString()[0]}${chatList[index].toString()[4]}".toUpperCase())));
                      },
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
