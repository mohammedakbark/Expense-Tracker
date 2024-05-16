import 'dart:developer';

import 'package:expensetracker/UI/controller/controller.dart';
import 'package:expensetracker/UI/pages/add_expence_page.dart';
import 'package:expensetracker/UI/pages/notification_page.dart';
import 'package:expensetracker/UI/pages/tabs/home_tab.dart';
import 'package:expensetracker/UI/pages/tabs/expence_view_tab.dart';
import 'package:expensetracker/UI/widgets/bottomnavigation.dart';
import 'package:expensetracker/UI/widgets/re-usable/colors.dart';
import 'package:expensetracker/UI/widgets/re-usable/responsive_helper.dart';
import 'package:expensetracker/UI/widgets/re-usable/styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});
  final pages = [
    const HomeTab(),
    const ExpenseViewTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[Provider.of<Controller>(context, listen: true)
          .selectedBottomNavIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColoR.darkGreen,
        shape: const CircleBorder(),
        onPressed: () {
          Provider.of<Controller>(context, listen: false).selectedDate =
              DateTime.now();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddExpense(),
          ));
        },
        child: const Icon(Iconsax.additem_bold),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}

// class customeButton extends StatelessWidget {
//   void Function()? onTap;
//   String title;
//   Color color;
//   customeButton(
//       {super.key,
//       required this.color,
//       required this.onTap,
//       required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       // splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
//       splashColor: Colors.transparent,
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         width: Sizer.w(context) * .35,
//         height: Sizer.h(context) * .3,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: color.withOpacity(.9)),
//         child: Text(
//           title,
//           style: CustomeTextStyle.poppinsStyle(
//               fontSize: 22, fontWeight: FontWeight.w600, color: ColoR.white),
//         ),
//       ),
//     );
//   }
// }
