import 'package:expensetracker/UI/widgets/re-usable/colors.dart';
import 'package:expensetracker/UI/widgets/re-usable/styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColoR.greyBlue,
            )),
        title: Text(
          "Notifications",
          style: CustomeTextStyle.poppinsStyle(
              fontWeight: FontWeight.w600, color: ColoR.greyBlue, fontSize: 28),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return const ListTile(
              leading: Icon(Iconsax.notification_circle_bulk),
              title: Text("A new notification"),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: 10),
    );
  }
}
