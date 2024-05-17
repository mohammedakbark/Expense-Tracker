import 'package:expensetracker/Data/db_controller.dart';
import 'package:expensetracker/Data/model/add_expence_model.dart';
import 'package:expensetracker/Business%20Logic/services/reminder_noti_service.dart';
import 'package:expensetracker/Presentation/controller/controller.dart';
import 'package:expensetracker/Presentation/pages/splash_page.dart';
import 'package:expensetracker/Presentation/widgets/re-usable/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(AddExpenceModelAdapter().typeId)) {
    Hive.registerAdapter(AddExpenceModelAdapter());
  }
  ReminderNotification.initNotification();
  ReminderNotification().showNotification();
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
        title: 'E.TRACKER',
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
