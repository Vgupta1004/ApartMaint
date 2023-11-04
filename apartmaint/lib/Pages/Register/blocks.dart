// ignore_for_file: body_might_complete_normally_nullable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'admin.dart';

class MyBlocks extends StatefulWidget {
  final DatabaseReference apartname;
  const MyBlocks({super.key, required this.apartname});

  @override
  _MyBlocksState createState() => _MyBlocksState();
}

class _MyBlocksState extends State<MyBlocks> {
  final _blocksKey = GlobalKey<FormState>();
  int _nb = 0;
  List<String> _bnames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Blocks Info'),
          centerTitle: true,
        ),
        body: Form(
            key: _blocksKey,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Number of Blocks'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the name of the building';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _nb = int.parse(value!);
                      },
                      onChanged: (value) {
                        setState(() {
                          _nb = int.tryParse(value) ?? 0;
                          _bnames = List.generate(_nb, (index) => '');
                        });
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _nb,
                        itemBuilder: (context, index) {
                          return TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Block ${index + 1}',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a block name';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                _bnames[index] = value;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_blocksKey.currentState!.validate()) {
                          _blocksKey.currentState?.save();

                          widget.apartname.update({
                            "nb": _nb,
                            "Blocks": _bnames,
                          });
                          print('Name: $_nb');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Admins(
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
