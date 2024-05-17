import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/Presentation/widgets/home_topcard.dart';
import 'package:expensetracker/Presentation/widgets/home_transactions.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/colors.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/responsive_helper.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  List<String> popUpItem = [
    "Restore",
  ];
  @override
  Widget build(BuildContext context) {
    final clearctr = Provider.of<DBController>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Sizer.w(context) * .5,
        leading: ListTile(
          title: Text(
            "Welcome!",
            style: CustomeTextStyle.poppinsStyle(
                color: const Color.fromARGB(255, 174, 169, 169), fontSize: 15),
          ),
          subtitle: Text(
            "E.TRACKER",
            style: CustomeTextStyle.poppinsStyle(
                fontWeight: FontWeight.bold,
                color: ColoR.greyBlue,
                // color: const Color.fromARGB(255, 174, 169, 169),
                fontSize: 25),
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: Icon(
              Iconsax.setting_2_bold,
              color: ColoR.greyBlue,
            ),
            itemBuilder: (context) => popUpItem
                .map((e) => PopupMenuItem(
                      onTap: () {
                        clearctr.clearBox();
                      },
                      child: ListTile(
                        trailing: Icon(Icons.restore),
                        title: Text(
                          e,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Sizer.h(context) * .1,
            ),
            const HomeTopCard(),
            SizedBox(
              height: Sizer.h(context) * .05,
            ),
            const Text(
              "Transactions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: Sizer.h(context) * .05,
            ),
            const HomeTransactions()
          ],
        ),
      ),
    );
  }
}
