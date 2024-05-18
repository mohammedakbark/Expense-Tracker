import 'package:expensetracker/Presentation/pages/navigation_page.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4)).then((then) =>
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
              "E.TRACKER",
              style: GoogleFonts.bebasNeue(
                  fontSize: 50, letterSpacing: 2, fontWeight: FontWeight.w500),
            ),
            Text(
              "Track your daily expenses",
              style:
                  CustomeTextStyle.poppinsStyle(fontSize: 13, letterSpacing: 2),
            )
          ],
        ),
      ),
    );
  }
}
