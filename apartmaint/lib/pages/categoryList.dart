import 'package:apartmaint/models/category.dart';
import 'package:apartmaint/pages/Selectedcategorypage.dart';
import 'package:apartmaint/pages/phone_number_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:apartmaint/helpers/utils.dart';
import 'package:apartmaint/widgets/CategoryCard.dart';

class categoryList extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories().cast<Category>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 265),
              padding: EdgeInsets.all(10),
              child: ClipOval(
                child: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 44, 220, 32),
                  size: 40,
                ),
              ),
            )
          ],
        ),
        body: Container(
            child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                  child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return CategoryCard(
                      category: categories[index],
                      onCardClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PhoneNumberInputScreen()));
                      });
                },
              ))
            ]),
          ],
        )));
  }
}
