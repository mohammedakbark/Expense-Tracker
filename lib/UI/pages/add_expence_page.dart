import 'dart:developer';

import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/Data/model/add_expence_model.dart';
import 'package:expensetracker/UI/controller/controller.dart';
import 'package:expensetracker/UI/widgets/re-usable/colors.dart';
import 'package:expensetracker/UI/widgets/re-usable/responsive_helper.dart';
import 'package:expensetracker/UI/widgets/re-usable/styles.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:expensetracker/UI/widgets/re-usable/textfield.dart';
import 'package:expensetracker/UI/widgets/re-usable/toast_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:uid/uid.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key});
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  String selectedCategory = "";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              final nav = Navigator.of(context);
              nav.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColoR.greyBlue,
            )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Add Expense",
          style: CustomeTextStyle.poppinsStyle(
              fontWeight: FontWeight.w600, color: ColoR.greyBlue, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Sizer.h(context) * .05,
                ),
                Consumer<Controller>(builder: (context, controller, child) {
                  return EasyInfiniteDateTimeLine(
                      onDateChange: (date) {
                        controller.changeSelectionDate(date);
                        log(controller.selectedDate!.toString());
                      },
                      dayProps: const EasyDayProps(
                          landScapeMode: false,
                          width: 100,
                          todayHighlightColor: Colors.red),
                      // showTimelineHeader: true,
                      firstDate: DateTime(
                        2024,
                      ),
                      focusDate: controller.selectedDate,
                      lastDate: DateTime.now());
                }),
                const SizedBox(
                  height: 40,
                ),
                CustomeTextField(
                    controller: descriptionController, hintText: "Description"),
                const SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  controller: amountController,
                  hintText: "Amount",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Select category";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Category",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColoR.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColoR.red),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColoR.red),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    items: Controller.expenseCategory.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (selected) {
                      selectedCategory = selected!;
                    }),
                SizedBox(
                  height: Sizer.h(context) * .6,
                ),
                SizedBox(
                    width: Sizer.w(context) * .7,
                    height: 60,
                    child: Consumer<Controller>(
                        builder: (context, controller, child) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColoR.red.withOpacity(.06)),
                          onPressed: () {
                            final id = UId.getId(quantityOfRandomString: 3)
                                .substring(6, 14);
                            log(id);
                            // log(
                            //   "${controller.selectedDate!.day}-${controller.selectedDate!.month}-${controller.selectedDate!.year}",
                            // );
                            // Provider.of<DBController>(context, listen: false)
                            //     .clearBox();
                            if (_formKey.currentState!.validate() &&
                                controller.selectedDate != null) {
                              Provider.of<DBController>(context, listen: false)
                                  .storeExpense(AddExpenceModel(
                                id: id,
                                amount: double.parse(amountController.text),
                                category: selectedCategory,
                                date:
                                    "${controller.selectedDate!.day}-${controller.selectedDate!.month}-${controller.selectedDate!.year}",
                                description: descriptionController.text,
                              ))
                                  .then((value) {
                                controller.resetDate();
                                ToastMessage.successToast(
                                    context, "Succesful !");
                                Navigator.of(context).pop();
                              });
                            } else {
                              ToastMessage.errorToast(context,
                                  "Select the date and fill the all field before submit your expence");
                            }
                          },
                          child: Text(
                            "Add Expense",
                            style: CustomeTextStyle.poppinsStyle(
                                fontSize: 16, color: ColoR.red),
                          ));
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
