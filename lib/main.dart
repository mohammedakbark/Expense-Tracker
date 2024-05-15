
import 'package:expensetracker/UI/controller/controller.dart';
import 'package:expensetracker/UI/pages/splash_page.dart';
import 'package:expensetracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Controller>(create: (_) => Controller())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // scaffoldBackgroundColor: ColoR.bgGreen,
          colorScheme: ColorScheme.fromSeed(seedColor: ColoR.bgGreen),
          useMaterial3: true,
        ),
        home: SplashPage(),
      ),
    );
  }
}
