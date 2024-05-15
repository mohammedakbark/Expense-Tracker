import 'dart:developer';

import 'package:expensetracker/Data/controller.dart';
import 'package:expensetracker/utils/colors.dart';
import 'package:expensetracker/utils/responsive_helper.dart';
import 'package:expensetracker/utils/styles.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key});
 
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
        child: Column(
          children: [
            SizedBox(
              height: Sizer.h(context) * .05,
            ),
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              headerProps: EasyHeaderProps(
                monthStyle: CustomeTextStyle.poppinsStyle(),
                selectedDateStyle:
                    CustomeTextStyle.poppinsStyle(fontWeight: FontWeight.bold),
                monthPickerType: MonthPickerType.switcher,
                showHeader: true,
              ),
              timeLineProps: const EasyTimeLineProps(),
              dayProps: const EasyDayProps(
                  landScapeMode: false,
                  width: 100,
                  todayHighlightColor: Colors.red),
              onDateChange: (selectedDate) {
                log(selectedDate.toString());
              },
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Description",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColoR.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Amount",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColoR.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration: InputDecoration(
                    hintText: "Category",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColoR.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                items: expenseCategory.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (selected) {}),
            const Expanded(flex: 5, child: SizedBox()),
            SizedBox(
                width: Sizer.w(context),
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColoR.red.withOpacity(.06)),
                    onPressed: () {},
                    child: Text(
                      "Add Expense",
                      style: CustomeTextStyle.poppinsStyle(
                          fontSize: 16, color: ColoR.red),
                    ))),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
