import 'package:expensetracker/UI/pages/navigation_page.dart';
import 'package:expensetracker/UI/widgets/re-usable/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((then) =>
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => NavigationPage()),
            (route) => false));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "day book",
              style: CustomeTextStyle.poppinsStyle(
                  fontSize: 50, letterSpacing: 2, fontWeight: FontWeight.w500),
            ),
            Text(
              "Save your money with day book",
              style:
                  CustomeTextStyle.poppinsStyle(fontSize: 13, letterSpacing: 2),
            )
          ],
        ),
      ),
    );
  }
}
