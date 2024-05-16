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
  }

  Future clearBox() async {
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    expenceBox.clear();
  }

  Future deleteFromBox(id) async {
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    expenceBox.delete(id);
    notifyListeners();
  }

  Future updateBox(id, AddExpenceModel updateObj) async {
    final expenceBox = await Hive.openBox<AddExpenceModel>("expence_db");
    var existingDoc = expenceBox.get(id);
    if (existingDoc != null) {
      existingDoc = updateObj;
      expenceBox.put(id, existingDoc);
      notifyListeners();
    }
  }

  //--
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
}
