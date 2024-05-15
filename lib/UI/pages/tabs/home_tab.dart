import 'package:expensetracker/UI/pages/notification_page.dart';
import 'package:expensetracker/UI/widgets/home_topcard.dart';
import 'package:expensetracker/UI/widgets/home_transactions.dart';
import 'package:expensetracker/utils/colors.dart';
import 'package:expensetracker/utils/responsive_helper.dart';
import 'package:expensetracker/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: ListTile(
          title: Text(
            "Welcome!",
            style: CustomeTextStyle.poppinsStyle(
                color: const Color.fromARGB(255, 174, 169, 169), fontSize: 15),
          ),
          subtitle: Text(
            "Day BooK",
            style: CustomeTextStyle.poppinsStyle(
                fontWeight: FontWeight.bold,
                color: ColoR.greyBlue,
                // color: const Color.fromARGB(255, 174, 169, 169),
                fontSize: 20),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationPage(),
                ));
              },
              icon: const Icon(Iconsax.notification_bold)),
          const SizedBox(
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
