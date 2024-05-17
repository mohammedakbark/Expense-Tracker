import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/Data/model/add_expence_model.dart';
import 'package:expensetracker/Presentation/controller/controller.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/colors.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/empty_data.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/responsive_helper.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/styles.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/textfield.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/toast_message.dart';
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
                        // showDragHandle: true,
                        context: context,
                        builder: (context) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: SizedBox(
                              height: Sizer.h(context) * .7,
                              child: Consumer2<Controller, DBController>(
                                  builder: (context, radioController,
                                      dbController, child) {
                                return SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SORT BY",
                                        style: CustomeTextStyle.poppinsStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Divider(),
                                      Column(
                                        children: [
                                          customeRadioButton(
                                              title: "Newest First",
                                              value: 0,
                                              onChanged: (selected) {
                                                dbController
                                                    .sortListByDate(false);

                                                radioController
                                                    .chageRadionValue(selected);
                                              },
                                              groupedValue: radioController
                                                  .selectedRadioButton),
                                          customeRadioButton(
                                              title: "Oldest First",
                                              value: 1,
                                              onChanged: (selected) {
                                                dbController
                                                    .sortListByDate(true);

                                                radioController
                                                    .chageRadionValue(selected);
                                              },
                                              groupedValue: radioController
                                                  .selectedRadioButton),
                                          customeRadioButton(
                                              title: "Expense -- Ascending",
                                              value: 2,
                                              onChanged: (selected) {
                                                dbController
                                                    .dortListByExpence(true);

                                                radioController
                                                    .chageRadionValue(selected);
                                              },
                                              groupedValue: radioController
                                                  .selectedRadioButton),
                                          customeRadioButton(
                                              title: "Expense -- Discending",
                                              value: 3,
                                              onChanged: (selected) {
                                                dbController
                                                    .dortListByExpence(false);

                                                radioController
                                                    .chageRadionValue(selected);
                                              },
                                              groupedValue: radioController
                                                  .selectedRadioButton),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                            )),
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
                        // showDragHandle: true,
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          child: SizedBox(
                            height: Sizer.h(context) * .8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Filters",
                                  style: CustomeTextStyle.poppinsStyle(
                                      fontSize: 18),
                                ),
                                const Divider(),
                                Consumer2<Controller, DBController>(builder:
                                    (context, checkBoxControler, dbController,
                                        child) {
                                  return Expanded(
                                    child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return CheckboxListTile(
                                              title: Text(
                                                Controller
                                                    .expenseCategory[index],
                                                style: CustomeTextStyle
                                                    .poppinsStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              value: checkBoxControler
                                                  .isCheckBoxEnabled[index],
                                              onChanged: (v) {
                                                checkBoxControler
                                                    .isCheckBoxSelected(
                                                        v!,
                                                        index,
                                                        Controller
                                                                .expenseCategory[
                                                            index]);
                                                dbController.filterList(
                                                    checkBoxControler
                                                        .selectedForFilter);
                                              });
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 20,
                                          );
                                        },
                                        itemCount:
                                            Controller.expenseCategory.length),
                                  );
                                })
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

  Widget customeRadioButton(
      {required String title,
      required int value,
      required void Function(Object?)? onChanged,
      required groupedValue}) {
    return RadioListTile(
        title: Text(
          title,
          style: CustomeTextStyle.poppinsStyle(
              fontSize: 18, fontWeight: FontWeight.w600),
        ),
        value: value,
        groupValue: groupedValue,
        onChanged: onChanged);
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
          final data = dbController.newListAfterchange.isEmpty
              ? dbController.expenceList
              : dbController.newListAfterchange;
          return data.isEmpty
              ? ShowEmptyView()
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
                              "${data[index].category}",
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              data[index].date,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
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
                                                          "Updated Succesful !");
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
                              dbController.deleteFromBox(data[index].id).then(
                                  (value) => ToastMessage.warningToast(
                                      context, "Deleted !"));
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
