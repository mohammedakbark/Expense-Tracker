import 'package:expensetracker/Presentation/widgets/re-usable/colors.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/responsive_helper.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class ShowEmptyView extends StatelessWidget {
  const ShowEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: ColoR.darkGreen,
        highlightColor: const Color.fromARGB(255, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/json/no_data.json",
                height: Sizer.h(context) * .5,
                reverse: true,
                width: Sizer.w(context)),
            Text(
              "No Records",
              style: CustomeTextStyle.poppinsStyle(),
            )
          ],
        ),
      ),
    );
  }
}
