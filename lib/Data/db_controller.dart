import 'dart:async';
import 'dart:developer';

import 'package:expensetracker/Data/model/add_expence_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class DBController with ChangeNotifier {
  Future storeExpense(AddExpenceModel addExpenceModel) async {
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    expenceBox.put(addExpenceModel.id, addExpenceModel);
    await getExpenses();
    notifyListeners();
  }

  List<AddExpenceModel> expenceList = [];
  Future getExpenses() async {
    expenceList.clear();
    final expDB = await Hive.openBox<AddExpenceModel>("expence_db");
    expenceList.addAll(expDB.values);
    expenceList.sort((a, b) {
      return b.date.compareTo(a.date);
    });
  }

  Future clearBox() async {
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    expenceBox.clear();
    notifyListeners();
  }

  Future deleteFromBox(id) async {
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    expenceBox.delete(id);
    newListAfterchange = [];
    notifyListeners();
  }

  Future updateBox(id, AddExpenceModel updateObj) async {
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    var existingDoc = expenceBox.get(id);
    if (existingDoc != null) {
      existingDoc = updateObj;
      expenceBox.put(id, existingDoc);
      newListAfterchange = [];
      notifyListeners();
    }
  }

  //-- Show Total -- //
  double totalExpence = 0;
  double todayExpence = 0;
  getTotalExpense() async {
    totalExpence = 0;
    todayExpence = 0;
    List<AddExpenceModel> list = [];

    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    list.addAll(expenceBox.values);
//---total
    for (var i in list) {
      totalExpence += i.amount;
    }
//-----day

    final today = list.where((element) {
      return element.date
          .contains(DateFormat("dd-M-yyyy").format(DateTime.now()).toString());
    }).toList();
    for (var i in today) {
      todayExpence += i.amount;
    }
  }

  //    Filtering and Sorting
  List<AddExpenceModel> newListAfterchange = [];
  sortListByDate(bool isAscending) async {
    newListAfterchange.clear();
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    newListAfterchange.addAll(expenceBox.values);
    newListAfterchange.sort((a, b) {
      return isAscending ? a.date.compareTo(b.date) : b.date.compareTo(a.date);
    });
    notifyListeners();
  }

  dortListByExpence(bool isAscending) async {
    newListAfterchange.clear();
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    newListAfterchange.addAll(expenceBox.values);
    newListAfterchange.sort((a, b) {
      return isAscending
          ? a.amount.compareTo(b.amount)
          : b.amount.compareTo(a.amount);
    });
    notifyListeners();
  }

  filterList(List<String> selected) async {
    newListAfterchange.clear();
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    newListAfterchange.addAll(expenceBox.values);
    newListAfterchange = expenceBox.values
        .where((element) => selected.contains(element.category))
        .toList();
    notifyListeners();
  }
}
