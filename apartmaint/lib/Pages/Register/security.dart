import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'amenity.dart';

class Security extends StatefulWidget {
  final DatabaseReference apartname;

  const Security({super.key, required this.apartname});

  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  final _securityKey = GlobalKey<FormState>();
  int _ns = 0;
  List<String> _snames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Security Staff Info'),
          centerTitle: true,
        ),
        body: Form(
            key: _securityKey,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Number of Security Staff'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the number of Security Staff';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _ns = int.parse(value!);
                      },
                      onChanged: (value) {
                        setState(() {
                          _ns = int.tryParse(value) ?? 0;
                          _snames = List.generate(_ns, (index) => '');
                        });
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _ns,
                        itemBuilder: (context, index) {
                          return TextFormField(
                            decoration: InputDecoration(
                              labelText:
                                  'Phone number of Security Staff ${index + 1}',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a phone number';
                              } else if (value.length != 10) {
                                return "Enter a valid Phone Number";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _snames[index] = value;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_securityKey.currentState!.validate()) {
                          _securityKey.currentState?.save();
                          print('Name: $_ns');
                          widget.apartname.update({
                            "ns": _ns,
                            "Security": _snames,
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Amenity(
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
