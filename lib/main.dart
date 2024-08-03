import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_expense/src/features/expense/presentations/add_expense_screen.dart';
import 'package:money_expense/src/features/expense/presentations/home_screen.dart';
import 'package:money_expense/src/theme_manager/color_manager.dart';
import 'package:money_expense/src/theme_manager/theme_data_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: ColorManager.white,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationThemeData(),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AddExpenseScreen.routeName: (context) => const AddExpenseScreen(),
      },
    );
  }
}
