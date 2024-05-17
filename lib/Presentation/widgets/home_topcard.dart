import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/Business%20Logic/services/reminder_noti_service.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/colors.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/responsive_helper.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeTopCard extends StatelessWidget {
  const HomeTopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await ReminderNotification().showNotification();
      },
      child: Container(
        height: Sizer.h(context) * .55,
        width: Sizer.w(context),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
            color: ColoR.black,
            borderRadius: const BorderRadius.all(Radius.elliptical(38, 50)),
            gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 3,
                tileMode: TileMode.clamp,
                colors: [
                  ColoR.gradientShade1,
                  ColoR.gradientShade3,

                  ColoR.gradientShade2,

                  ColoR.gradientShade1,

                  // ColoR.black,
                ])),
        child: Consumer<DBController>(builder: (context, dbController, child) {
          return FutureBuilder(
              future: dbController.getTotalExpense(),
              builder: (context, snpashot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Total Expense",
                          style: CustomeTextStyle.poppinsStyle(
                              color: ColoR.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Iconsax.arrow_down_1_outline,
                          color: ColoR.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.currency_rupee_outlined,
                          size: 20,
                          color: ColoR.white,
                        ),
                        Text(
                          dbController.totalExpence.toString(),
                          style: CustomeTextStyle.poppinsStyle(
                              color: ColoR.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 40),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Text(
                          "Today",
                          style: CustomeTextStyle.poppinsStyle(
                              color: ColoR.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Iconsax.arrow_down_1_outline,
                          color: ColoR.white,
                          size: 18,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.currency_rupee_outlined,
                          size: 18,
                          color: ColoR.white,
                        ),
                        Text(
                          dbController.todayExpence.toString(),
                          style: CustomeTextStyle.poppinsStyle(
                              color: ColoR.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                );
              });
        }),
      ),
    );
  }
}
