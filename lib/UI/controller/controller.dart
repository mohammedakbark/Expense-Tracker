import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  int selectedBottomNavIndex = 0;

  void changeBottomNavIndex(index) {
    selectedBottomNavIndex = index;
    notifyListeners();
  }
}
