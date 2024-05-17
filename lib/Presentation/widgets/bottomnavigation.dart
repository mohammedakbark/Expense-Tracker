import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expensetracker/Presentation/controller/controller.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({
    super.key,
  });

  final iconList = [
    Iconsax.menu_outline,
    
    Iconsax.chart_outline,
   
  ];

  @override
  Widget build(BuildContext context) {
    final navController = Provider.of<Controller>(context);
    return AnimatedBottomNavigationBar.builder(
      onTap: (index) {
        navController.changeBottomNavIndex(index);
      },
      activeIndex: navController.selectedBottomNavIndex,
      itemCount: 2,
      tabBuilder: (int index, bool isActive) {
        return Icon(
          iconList[index],
          size: 30,
          color: isActive ? ColoR.darkGreen : ColoR.grey,
        );
      },
      gapLocation: GapLocation.center,
      height: 70,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 25,
      rightCornerRadius: 25,
    );
  }
}
