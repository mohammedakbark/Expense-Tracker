import 'package:expensetracker/UI/widgets/re-usable/colors.dart';
import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  static const List<String> expenseCategory = [
    "Petrol",
    "Grocey",
    "Food",
    "Cloth",
    "Recharge",
    "Loan/EMI",
    "Other"
  ];
   final List<String> _expenseCategoryImages = [
    "assets/images/fuel.png",
    "assets/images/grocery.png",
    "assets/images/food.png",
    "assets/images/cloth.png",
    "assets/images/recharge.png",
    "assets/images/loan.png",
    "assets/images/other.png"
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
      case "Other":
        {
          return Image.asset(
            _expenseCategoryImages[6],
            color: ColoR.white,
          );
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
    selectedDate = selected;
    notifyListeners();
  }
}
