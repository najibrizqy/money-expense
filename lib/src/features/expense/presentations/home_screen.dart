import 'package:flutter/material.dart';
import 'package:money_expense/src/common_widgets/category_card_widget.dart';
import 'package:money_expense/src/common_widgets/expense_card_widget.dart';
import 'package:money_expense/src/common_widgets/history_card_widget.dart';
import 'package:money_expense/src/features/expense/domain/expense.dart';
import 'package:money_expense/src/features/expense/presentations/add_expense_screen.dart';
import 'package:money_expense/src/services/database_helper.dart';
import 'package:money_expense/src/theme_manager/color_manager.dart';
import 'package:money_expense/src/theme_manager/font_manager.dart';
import 'package:money_expense/src/theme_manager/style_manager.dart';
import 'package:money_expense/src/utils/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Expense>> _expenseList;

  @override
  void initState() {
    super.initState();
    _refreshExpenseList();
  }

  void _refreshExpenseList() {
    setState(() {
      _expenseList = DatabaseHelper().queryAllExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.primary,
        onPressed: () {
          Navigator.pushNamed(context, AddExpenseScreen.routeName)
              .then((value) {
            _refreshExpenseList();
          });
        },
        shape: const StadiumBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, User!',
                      style: getBlackTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeighManager.bold,
                      ),
                    ),
                    Text(
                      'Jangan lupa catat keuanganmu setiap hari!',
                      style: getGrayTextStyle(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ExpenseCardWidget(
                          title: 'Pengeluaran \nhari ini',
                          amount: '30.000',
                          backgroundColor: ColorManager.primary,
                        ),
                        ExpenseCardWidget(
                          title: 'Pengeluaran \nbulan ini',
                          amount: '350.000',
                          backgroundColor: ColorManager.teal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Pengeluaran berdasarkan kategori',
                  style: getBlackTextStyle(
                    fontWeight: FontWeighManager.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      CategoryCardWidget(
                        title: 'Makanan',
                        amount: '70.000',
                        iconColor: ColorManager.yellow,
                        images: 'assets/images/food.png',
                      ),
                      CategoryCardWidget(
                        title: 'Internet',
                        amount: '50.000',
                        iconColor: ColorManager.blue3,
                        images: 'assets/images/internet.png',
                      ),
                      CategoryCardWidget(
                        title: 'Transport',
                        amount: '20.000',
                        iconColor: ColorManager.purple,
                        images: 'assets/images/car.png',
                      ),
                      CategoryCardWidget(
                        title: 'Hadiah',
                        amount: '100.000',
                        iconColor: ColorManager.red,
                        images: 'assets/images/gift.png',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hari ini',
                      style: getBlackTextStyle(
                        fontWeight: FontWeighManager.bold,
                      ),
                    ),
                    HistoryCardWidget(
                      title: 'Ayam Geprek',
                      amount: 15000,
                      iconColor: ColorManager.yellow,
                      images: 'assets/images/food.png',
                    ),
                    HistoryCardWidget(
                      title: 'Gojek',
                      amount: 15000,
                      iconColor: ColorManager.purple,
                      images: 'assets/images/car.png',
                    ),
                    FutureBuilder<List<Expense>>(
                      future: _expenseList,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const SizedBox.shrink();
                        } else {
                          // Mapping the list of expenses to a list of widgets
                          List<Widget> expenseWidgets =
                              snapshot.data!.map((expense) {
                            return HistoryCardWidget(
                              title: expense.name,
                              amount: expense.amount,
                              iconColor:
                                  getColorBasedOnCategory(expense.category),
                              images:
                                  getImagesBasedOnCategory(expense.category),
                            );
                          }).toList();

                          return Column(
                            children: expenseWidgets,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Kemarin',
                      style: getBlackTextStyle(
                        fontWeight: FontWeighManager.bold,
                      ),
                    ),
                    HistoryCardWidget(
                      title: 'Paket Data',
                      amount: 50000,
                      iconColor: ColorManager.blue3,
                      images: 'assets/images/internet.png',
                    ),
                    HistoryCardWidget(
                      title: 'Gojek',
                      amount: 15000,
                      iconColor: ColorManager.purple,
                      images: 'assets/images/car.png',
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
