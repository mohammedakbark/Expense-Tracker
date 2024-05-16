import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/Data/model/add_expence_model.dart';
import 'package:expensetracker/UI/controller/controller.dart';
import 'package:expensetracker/UI/pages/splash_page.dart';
import 'package:expensetracker/UI/widgets/re-usable/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(AddExpenceModelAdapter().typeId)) {
    Hive.registerAdapter(AddExpenceModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Controller>(create: (_) => Controller()),
                ChangeNotifierProvider<DBController>(create: (_) => DBController())

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
