import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Submited.dart';

class Amenity extends StatefulWidget {
  final DatabaseReference apartname;
  const Amenity({super.key, required this.apartname});

  @override
  _AmenityState createState() => _AmenityState();
}

class _AmenityState extends State<Amenity> {
  final _amenityKey = GlobalKey<FormState>();
  int _nam = 0;
  List<String> _amnames = [];
  List<String> _amcost = [];
  List<String> _amdet = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Amenities Info'),
          centerTitle: true,
        ),
        body: Form(
            key: _amenityKey,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Number of Amenities'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the number of Amenities';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _nam = int.parse(value!);
                      },
                      onChanged: (value) {
                        setState(() {
                          _nam = int.tryParse(value) ?? 0;
                          _amnames = List.generate(_nam, (index) => '');
                          _amcost = List.generate(_nam, (index) => '');
                          _amdet = List.generate(_nam, (index) => '');
                        });
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _nam,
                        itemBuilder: (context, index) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Name of Amenity'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter the name of the Amenity';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _amnames[index] = value;
                                  },
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Cost of Amenity'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter the cost';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _amcost[index] = value;
                                  },
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Datails of Amenity'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter the details';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _amdet[index] = value;
                                  },
                                ),
                              ]);
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            if (_amenityKey.currentState!.validate()) {
                              _amenityKey.currentState?.save();
                              print('Name: $_nam');
                              widget.apartname.update({
                                "nam": _nam,
                                "AmenityName": _amnames,
                                "AmenityCost": _amcost,
                                "AmenityDettails": _amdet,
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubmissionPage()));
                            }
                          },
                          child: const Text("Submit"),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubmissionPage()));
                          },
                          child: const Text("Skip and Submit"),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
