import 'package:flutter/material.dart';
import 'blocks.dart';
import 'package:firebase_database/firebase_database.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  final _infoKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Basic Info'),
          centerTitle: true,
        ),
        body: Form(
            key: _infoKey,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Name of the Society'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the name of the building';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                        // ref.set({
                        //   "name": _name,
                        // });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Address'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the Address of the building';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _address = value!;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_infoKey.currentState!.validate()) {
                          _infoKey.currentState?.save();
                          print('Name: $_name');
                          print('Address: $_address');
                          final apartName = ref.child('$_name/');
                          apartName.set({
                            "Address": _address,
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBlocks(
                                        apartname: apartName,
                                      )));
                        }
                      },
                      child: const Text("Next"),
                    )
                  ],
                ))));
  }
}
