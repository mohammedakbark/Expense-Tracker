import 'package:hive_flutter/adapters.dart';
part 'add_expence_model.g.dart';

@HiveType(typeId: 1)
class AddExpenceModel {
  @HiveField(0)
  String ?id;

  @HiveField(1)
  String category;

  @HiveField(2)
  double amount;

  @HiveField(3)
  String description;

  @HiveField(4)
  String date;

  AddExpenceModel(
      {required this.amount,
      required this.category,
      required this.date,
      required this.description,
       this.id});
}
