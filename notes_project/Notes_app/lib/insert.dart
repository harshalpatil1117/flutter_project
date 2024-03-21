import 'package:flutter/material.dart';

import 'database.dart';
import 'main.dart';
import 'model.dart';

enum gender { Male, Female }

class Insert extends StatefulWidget {
  Insert(
      {super.key,
      this.id,
      this.name,
      this.age,
      this.number,
      this.gender,
      this.checkData});

  int? id;
  String? name, age, number, gender;
  bool? checkData;

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  DB? db;
  List<DataModel> data = [];

  RegExp ageExp = RegExp(r'^[0-9]{1,3}$');
  RegExp numberExp = RegExp(r'^[0-9]{10}$');

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  String _selectedOption = gender.Male.name;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name ?? "";
    _ageController.text = widget.age ?? '';
    _numberController.text = widget.number ?? '';
    _selectedOption = widget.gender ?? gender.Male.name;
    db = DB();
  }

  Future getData() async {
    data = await db!.getData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Form(
                key: key,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Enter Your Name',
                          label: RichText(
                            text: TextSpan(
                              text: 'Name',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                              children: [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 3,
                        validator: (value) {
                          if (!ageExp.hasMatch(value!)) {
                            return 'Please Enter Your Valid Age';
                          }
                          return null;
                        },
                        controller: _ageController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Enter Your Age',
                          label: RichText(
                            text: TextSpan(
                              text: 'Age',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                              children: [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 10,
                        validator: (value) {
                          if (!numberExp.hasMatch(value!)) {
                            return 'Please Enter A Valid Mobile Number';
                          }
                          return null;
                        },
                        controller: _numberController,
                        decoration:  InputDecoration(
                          isDense: true,
                          hintText: 'Enter Your Number',
                          label: RichText(
                            text: TextSpan(
                              text: 'Number',
                              style: TextStyle(color: Colors.black,fontSize: 18),
                              children: [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid),),
                        ),
                      ),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: RadioListTile(
                                title: Text('Male'),
                                value: gender.Male.name,
                                groupValue: _selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOption = value!;
                                    print(_selectedOption);
                                  });
                                }),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2,
                              child: RadioListTile(
                                  title: Text('Female'),
                                  value: gender.Female.name,
                                  groupValue: _selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedOption = value!;
                                      print(_selectedOption);
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),

                      ElevatedButton(
                        onPressed: () async {
                          if (key.currentState!.validate()) {
                            saveData();
                          }

                          FocusScope.of(context).unfocus();
                        },
                        child: const Text(
                          'Submit',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void saveData() async {
    if (widget.checkData != null) {
      DataModel newData = data[widget.id!];
      newData.name = _nameController.text;
      newData.age = _ageController.text;
      newData.number = _numberController.text;
      newData.gender = _selectedOption;
      db!.updateNote(newData, newData.id!);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LocalStorage()),
          (route) => false);
      // if (_nameController.text.isNotEmpty &&
      //     _ageController.text.isNotEmpty &&
      //     _numberController.text.isNotEmpty &&
      //     _selectedOption.isNotEmpty) {
      //   DataModel newData = data[widget.id!];
      //   newData.name = _nameController.text;
      //   newData.age = _ageController.text;
      //   newData.number = _numberController.text;
      //   newData.gender = _selectedOption;
      //   db!.updateNote(newData, newData.id!);
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => LocalStorage()),
      //           (route) => false);
      // }
    } else {
      DataModel dataLocal = DataModel(
          name: _nameController.text,
          age: _ageController.text,
          number: _numberController.text,
          gender: _selectedOption);
      db!.insertData(dataLocal);
      _nameController.clear();
      _ageController.clear();
      _numberController.clear();

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LocalStorage()),
          (route) => false);
      // if (_nameController.text.isNotEmpty &&
      //     ageExp.hasMatch(_ageController.text) &&
      //     numberExp.hasMatch(_numberController.text) &&
      //     _selectedOption.isNotEmpty) {
      //   DataModel dataLocal = DataModel(
      //       name: _nameController.text,
      //       age: _ageController.text,
      //       number: _numberController.text,
      //       gender: _selectedOption);
      //   db!.insertData(dataLocal);
      //   _nameController.clear();
      //   _ageController.clear();
      //   _numberController.clear();
      //
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => LocalStorage()),
      //       (route) => false);
      // }
      // else{
      //   print('please enter a valid age');
      // }
    }
  }
}
