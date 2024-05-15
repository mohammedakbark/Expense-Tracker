import 'package:expensetracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTransactions extends StatelessWidget {
  const HomeTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text(
                  "Money Transfer",
                  style: TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  "12:35 PM",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  index.isEven ? "-₹100" : "+₹100",
                  style: GoogleFonts.aDLaMDisplay(
                      fontSize: 25,
                      color: index.isEven ? ColoR.red : ColoR.green),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: 20));
  }
}
