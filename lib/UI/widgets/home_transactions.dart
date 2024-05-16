import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/UI/controller/controller.dart';
import 'package:expensetracker/UI/widgets/re-usable/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeTransactions extends StatelessWidget {
  const HomeTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DBController>(builder: (context, dbController, child) {
      return Builder(builder: (context) {
        return FutureBuilder(
            future: dbController.getExpenses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              final data = dbController.expenceList;
              return Expanded(
                  child: data.isEmpty
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                  maxRadius: 30,
                                  backgroundColor: Controller()
                                      .bgColor(data[index].category),
                                  child: Controller()
                                      .selectImage(data[index].category)),
                              title: Text(
                                data[index].category,
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                data[index].description,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: Text(
                                "₹${data[index].amount.toDouble().toString()}",
                                style: GoogleFonts.aDLaMDisplay(
                                    fontSize: 25, color: ColoR.red),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: data.length));
            });
      });
    });
  }
}
