import 'package:expensetracker/Presentation/widgets/re-usable/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
          
              maxRadius: 120,
              child: Image.asset(
                "assets/wallet.png",
                scale: 3,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              "Save your money with\nE.TRACKER",
              style: CustomeTextStyle.poppinsStyle(
                
              ),
            ),
            Text(
              "Save money! The more your money works for you, the less you have work for money",
              style: CustomeTextStyle.poppinsStyle(),
            )
          ],
        ),
      ),
    );
  }
}
