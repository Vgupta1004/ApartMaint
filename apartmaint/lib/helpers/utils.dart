import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:apartmaint/models/category.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
        color: Color.fromARGB(255, 44, 220, 32),
        name: "Residents",
        imgName: "residents",
      ),
      Category(
        color: Color.fromARGB(255, 44, 220, 32),
        name: "Security",
        imgName: "security",
      ),
      Category(
        color: Color.fromARGB(255, 44, 220, 32),
        name: "Admin",
        imgName: "admin",
      ),
    ];
  }
}
