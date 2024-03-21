

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/splash.dart';
import 'package:path/path.dart';

import 'database.dart';
import 'insert.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


class LocalStorage extends StatefulWidget {
  const LocalStorage({super.key});

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  DB? db;
  List<DataModel> data = [];
  bool fetchingData = true;

  @override
  void initState() {
    super.initState();
    db = DB();
  }

  Future getData() async {
    data = await db!.getData();
    fetchingData = false;
  }

  void deleteNote(int index) {
    db!.deleteNote(data[index].id!);
    setState(() {
      data.removeAt(index);
    });
  }

  Future<bool> _showBackDialog(int index, BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text(
                'Are you sure you want to delete this note',
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme
                        .of(context)
                        .textTheme
                        .labelLarge,
                  ),
                  child: const Text('Yes'),
                  onPressed: () async {
                    setState(() {
                      deleteNote(index);
                    });

                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme
                        .of(context)
                        .textTheme
                        .labelLarge,
                  ),
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )).then((value) => value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Notes')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => Insert()));
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return data.isEmpty
                ? fetchingData == true
                ? const Text("")
                : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.note, size: 70, color: Colors.grey[900]),
                      Text("Empty".toUpperCase(),
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontStyle: FontStyle.italic,
                              letterSpacing: 7))
                    ]))
                : fetchingData == true
                ? const Text("")
                : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final name = data[index].name;
                  final age = data[index].age;
                  final number = data[index].number;
                  final gender = data[index].gender;
                  print(data[index].name);
                  print(data[index].age);
                  print(data[index].number);

                  return ListTile(
                    onLongPress: () {
                      _showBackDialog(index, context);
                    },
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) =>
                          Insert(id: index,
                              name: name,
                              age: age,
                              number: number,
                              gender: gender,
                              checkData: true)));
                    },
                    title: Text('${data[index].name!} (${data[index].age})'),
                    leading: CircleAvatar(backgroundColor: int.parse(data[index].age!) >= 18
                            ? Colors.green
                            : Colors.red[300], child: Text(data[index].gender![0])),
                    subtitle: Text(data[index].number!),
                  );
                });
          },
        ),
      ),
    );
  }
}
