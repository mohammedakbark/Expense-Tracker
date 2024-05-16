import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/Data/model/add_expence_model.dart';
import 'package:expensetracker/UI/controller/controller.dart';
import 'package:expensetracker/UI/widgets/re-usable/colors.dart';
import 'package:expensetracker/UI/widgets/re-usable/responsive_helper.dart';
import 'package:expensetracker/UI/widgets/re-usable/styles.dart';
import 'package:expensetracker/UI/widgets/re-usable/textfield.dart';
import 'package:expensetracker/UI/widgets/re-usable/toast_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:uid/uid.dart';

class ExpenseViewTab extends StatelessWidget {
  ExpenseViewTab({super.key});

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
                //  ----------Sort
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
                                        const CircleAvatar(),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          Controller.expenseCategory[index],
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
                                itemCount: Controller.expenseCategory.length),
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
                //------------Filter
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
  List<String> popUpItem = ["UPDATE", "DELETE"];
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  String selectedCategory = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dbController = Provider.of<DBController>(context);
    return FutureBuilder(
        future: dbController.getExpenses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          final data = dbController.expenceList;
          return data.isEmpty
              ? const Center(
                  child: Text("No Data"),
                )
              : ListView.separated(
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
                            leading: CircleAvatar(
                              backgroundColor:
                                  Controller().bgColor(data[index].category),
                              maxRadius: 30,
                              child: Controller()
                                  .selectImage(data[index].category),
                            ),
                            title: Text(
                              data[index].category,
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              data[index].description,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Text("₹${data[index].amount}",
                                style: GoogleFonts.aDLaMDisplay(
                                  fontSize: 18,
                                )),
                          ),
                        ),
                        PopupMenuButton(
                          onSelected: (value) {
                            if (value == "UPDATE") {
                              amountController.text =
                                  data[index].amount.toString();
                              selectedCategory = data[index].category;
                              descriptionController.text =
                                  data[index].description;
                              
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // height: Sizer.h(context) * 1,
                                    title: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Consumer<Controller>(builder:
                                              (context, controller, child) {
                                            return TextButton(
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    Provider.of<DBController>(
                                                            context,
                                                            listen: false)
                                                        .updateBox(
                                                            data[index].id,
                                                            AddExpenceModel(
                                                              id: data[index]
                                                                  .id,
                                                              amount: double.parse(
                                                                  amountController
                                                                      .text),
                                                              category:
                                                                  selectedCategory,
                                                              date: data[index]
                                                                  .date,
                                                              description:
                                                                  descriptionController
                                                                      .text,
                                                            ))
                                                        .then((value) {
                                                      controller.resetDate();
                                                      ToastMessage.successToast(
                                                          context,
                                                          "Succesful !");
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  } else {
                                                    ToastMessage.errorToast(
                                                        context,
                                                        "Select the date and fill the all field before submit your expence");
                                                  }
                                                },
                                                child: Text(
                                                  "UPDATE",
                                                  style: CustomeTextStyle
                                                      .poppinsStyle(
                                                          fontSize: 16,
                                                          color: ColoR.red,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ));
                                          }),
                                        
                                          Form(
                                            key: _formKey,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        Sizer.h(context) * .05,
                                                  ),
                                                  CustomeTextField(
                                                      controller:
                                                          descriptionController,
                                                      hintText: "Description"),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  CustomeTextField(
                                                    controller:
                                                        amountController,
                                                    hintText: "Amount",
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  DropdownButtonFormField(
                                                      value: selectedCategory,
                                                      validator: (value) {
                                                        if (value == null) {
                                                          return "Select category";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Category",
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: ColoR
                                                                        .green),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              errorBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: ColoR
                                                                          .red),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10)),
                                                              focusedErrorBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: ColoR
                                                                          .red),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10))),
                                                      items: Controller
                                                          .expenseCategory
                                                          .map((e) {
                                                        return DropdownMenuItem(
                                                            value: e,
                                                            child: Text(e));
                                                      }).toList(),
                                                      onChanged: (selected) {
                                                        selectedCategory =
                                                            selected!;
                                                      }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              dbController.deleteFromBox(data[index].id);
                            }
                          },
                          itemBuilder: (context) => popUpItem
                              .map((e) => PopupMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                        ),
                      ]),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: data.length);
        });
  }
}
