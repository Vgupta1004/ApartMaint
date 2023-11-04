import 'package:apartmaint/pages/categoryList.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset('assets/images/bg1.png', fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: Color.fromARGB(255, 44, 220, 32),
                        alignment: Alignment.center,
                        child: Icon(Icons.home, color: Colors.white, size: 100),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'APARTMAINT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: Color.fromARGB(255, 44, 220, 32),
                          padding: EdgeInsets.all(25),
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Register',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Color.fromARGB(255, 44, 220, 32)
                                  .withOpacity(0.2),
                              highlightColor: Color.fromARGB(255, 44, 220, 32)
                                  .withOpacity(0.2),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => categoryList()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Text('Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 44, 220, 32),
                                        fontWeight: FontWeight.bold)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Color.fromARGB(255, 44, 220, 32),
                                        width: 4)),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
