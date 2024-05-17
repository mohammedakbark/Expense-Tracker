import 'dart:developer';

import 'package:expensetracker/Presentation/widgets/re-usable/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  static const List<String> expenseCategory = [
    "Petrol",
    "Grocey",
    "Food",
    "Cloth",
    "Recharge",
    "Loan/EMI",
    "Travel",
    "Other"
  ];
  final List<String> _expenseCategoryImages = [
    "assets/fuel.png",
    "assets/grocery.png",
    "assets/food.png",
    "assets/cloth.png",
    "assets/recharge.png",
    "assets/loan.png",
    "assets/travel.png",
    "assets/other.png"
  ];

  selectImage(
    String category,
  ) {
    switch (category) {
      case "Petrol":
        {
          return Image.asset(
            _expenseCategoryImages[0],
            color: ColoR.white,
          );
        }
      case "Grocey":
        {
          return Image.asset(
            _expenseCategoryImages[1],
            color: ColoR.white,
          );
        }
      case "Food":
        {
          return Image.asset(
            _expenseCategoryImages[2],
            color: ColoR.white,
          );
        }
      case "Cloth":
        {
          return Image.asset(
            _expenseCategoryImages[3],
            color: ColoR.white,
          );
        }
      case "Recharge":
        {
          return Image.asset(
            _expenseCategoryImages[4],
            color: ColoR.white,
          );
        }
      case "Loan/EMI":
        {
          return Image.asset(
            _expenseCategoryImages[5],
            color: ColoR.white,
          );
        }
      case "Travel":
        {
          return Image.asset(
            _expenseCategoryImages[6],
            color: ColoR.white,
          );
        }
      case "Other":
        {
          return Image.asset(
            _expenseCategoryImages[7],
            color: ColoR.white,
          );
        }
    }
  }

  bgColor(
    String category,
  ) {
    switch (category) {
      case "Petrol":
        {
          return const Color.fromARGB(255, 48, 108, 206);
        }
      case "Grocey":
        {
          return const Color.fromARGB(255, 48, 206, 169);
        }
      case "Food":
        {
          return const Color.fromARGB(255, 174, 48, 206);
        }
      case "Cloth":
        {
          return const Color.fromARGB(255, 48, 206, 72);
        }
      case "Recharge":
        {
          return const Color.fromARGB(255, 48, 182, 206);
        }
      case "Loan/EMI":
        {
          return const Color.fromARGB(255, 203, 206, 48);
        }
      case "Travel":
        {
          return const Color.fromARGB(255, 48, 206, 140);
        }
      case "Other":
        {
          return const Color.fromARGB(255, 0, 0, 0);
        }
    }
  }

  int selectedBottomNavIndex = 0;

  void changeBottomNavIndex(index) {
    selectedBottomNavIndex = index;
    notifyListeners();
  }

  DateTime? selectedDate = DateTime.now();
  resetDate() {
    selectedDate = DateTime.now();
    notifyListeners();
  }

  changeSelectionDate(DateTime selected) {
    log(selected.toString());
    selectedDate = selected;
    notifyListeners();
  }

  int? selectedRadioButton;

  chageRadionValue(selected) {
    selectedRadioButton = selected;
    
    notifyListeners();
  }

  List<String> selectedForFilter = [];
  List<bool> isCheckBoxEnabled =
      List<bool>.filled(expenseCategory.length, false);
  isCheckBoxSelected(bool value, index, String item) {
    isCheckBoxEnabled[index] = value;
    if (value == true) {
      selectedForFilter.add(item);
      print(selectedForFilter);
    } else {
      selectedForFilter.removeWhere((element) => element == item);
      print(selectedForFilter);
    }
    notifyListeners();
  }
}
