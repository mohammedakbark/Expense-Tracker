import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/UI/controller/controller.dart';
import 'package:expensetracker/UI/widgets/re-usable/colors.dart';
import 'package:expensetracker/UI/widgets/re-usable/responsive_helper.dart';
import 'package:expensetracker/UI/widgets/re-usable/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class ExpenseViewTab extends StatelessWidget {
  const ExpenseViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Center(
          child: Text(
            "Expenses",
            style: CustomeTextStyle.poppinsStyle(
                fontWeight: FontWeight.w600,
                color: ColoR.greyBlue,
                fontSize: 28),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          child: SizedBox(
                            height: 200,
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      log(Controller.expenseCategory[index]);
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                       Controller.   expenseCategory[index],
                                          style: CustomeTextStyle.poppinsStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount:Controller. expenseCategory.length),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.sort),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Sort", style: CustomeTextStyle.poppinsStyle()),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          child: SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                                Text(
                                  "Select date from here",
                                  style: CustomeTextStyle.poppinsStyle(
                                      fontSize: 18),
                                ),
                                EasyDateTimeLine(
                                  initialDate: DateTime.now(),
                                  headerProps: EasyHeaderProps(
                                    monthStyle: CustomeTextStyle.poppinsStyle(),
                                    selectedDateStyle:
                                        CustomeTextStyle.poppinsStyle(
                                            fontWeight: FontWeight.bold),
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
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text("Filter", style: CustomeTextStyle.poppinsStyle()),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.filter_alt_rounded),
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListviewBuilder(color: ColoR.bgGreen.withOpacity(.09))),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListviewBuilder extends StatelessWidget {
  Color color;
  ListviewBuilder({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            height: Sizer.h(context) * .22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Expanded(
                child: ListTile(
                  leading: const CircleAvatar(),
                  title: const Text(
                    "Grocery",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    "12:35 PM",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Text("₹200",
                      style: GoogleFonts.aDLaMDisplay(
                        fontSize: 18,
                      )),
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
            ]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: 20);
  }
}
