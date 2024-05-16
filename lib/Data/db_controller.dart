import 'package:expensetracker/Data/model/add_expence_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

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
}
