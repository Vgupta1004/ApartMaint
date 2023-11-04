// ignore_for_file: body_might_complete_normally_nullable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'security.dart';

class Admins extends StatefulWidget {
  final DatabaseReference apartname;
  const Admins({super.key, required this.apartname});

  @override
  _AdminsState createState() => _AdminsState();
}

class _AdminsState extends State<Admins> {
  final _adminsKey = GlobalKey<FormState>();
  int _na = 0;
  List<String> _anames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Admins Info'),
          centerTitle: true,
        ),
        body: Form(
            key: _adminsKey,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Number of Admins'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the number of Admins';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _na = int.parse(value!);
                      },
                      onChanged: (value) {
                        setState(() {
                          _na = int.tryParse(value) ?? 0;
                          _anames = List.generate(_na, (index) => '');
                        });
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _na,
                        itemBuilder: (context, index) {
                          return TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone number of Admin ${index + 1}',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a phone number';
                              } else if (value.length != 10) {
                                return "Enter a valid Phone Number";
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                _anames[index] = value;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_adminsKey.currentState!.validate()) {
                          _adminsKey.currentState?.save();
                          print('Name: $_na');
                          widget.apartname.update({
                            "na": _na,
                            "Admins": _anames,
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Security(
                                        apartname: widget.apartname,
                                      )));
                        }
                      },
                      child: const Text("Next"),
                    )
                  ],
                ))));
  }
}
