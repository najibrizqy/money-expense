import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy/jiffy.dart';
import 'package:money_expense/src/common_widgets/app_bar_widget.dart';
import 'package:money_expense/src/common_widgets/category_modal_widget.dart';
import 'package:money_expense/src/features/expense/domain/category.dart';
import 'package:money_expense/src/features/expense/domain/expense.dart';
import 'package:money_expense/src/services/database_helper.dart';
import 'package:money_expense/src/theme_manager/color_manager.dart';
import 'package:money_expense/src/theme_manager/font_manager.dart';
import 'package:money_expense/src/theme_manager/style_manager.dart';
import 'package:money_expense/src/utils/number_format.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class AddExpenseScreen extends StatefulWidget {
  static const String routeName = '/add-expense-screen';
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _expenseNameController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category(
    title: 'Pilih Kategori',
    color: ColorManager.gray3,
    images: 'assets/images/food.png',
  );
  String _selectedDate = 'Tanggal Pengeluaran';

  void setTimeElapsedLocale() async {
    await Jiffy.setLocale('id');
  }

  @override
  void initState() {
    super.initState();
    setTimeElapsedLocale();
    _expenseNameController.addListener(_updateButtonState);
    _amountController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _expenseNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  bool _isButtonEnabled() {
    return _expenseNameController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _selectedDate != 'Tanggal Pengeluaran' &&
        _selectedCategory.title != 'Pilih Kategori';
  }

  Future _showModalCategory(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) => CategoryModalWidget(
        onCategorySelected: (Category category) {
          setState(() {
            _selectedCategory = category;
          });
        },
      ),
    );
  }

  _saveExpense() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Expense expense = Expense(
        name: _expenseNameController.text,
        category: _selectedCategory.title,
        date: _selectedDate,
        amount:
            int.parse(_amountController.text.replaceAll('.', '').split(' ')[1]),
      );
      await DatabaseHelper().insertExpense(expense.toMap());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(title: 'Tambah Pengeluaran Baru'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _expenseNameController,
                          decoration:
                              getInputDecoration(hintText: 'Nama Pengeluaran'),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            _showModalCategory(context);
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorManager.gray2),
                              ),
                              contentPadding: const EdgeInsets.all(15),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  _selectedCategory.images,
                                  color: _selectedCategory.color,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    _selectedCategory.title,
                                    style: getBlackTextStyle(),
                                  ),
                                ),
                                Image.asset('assets/images/right_circle.png')
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () async {
                            // Show date picker
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              String date =
                                  "${pickedDate.toLocal()}".split(' ')[0];
                              setState(() {
                                _selectedDate = date;
                              });
                            }
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorManager.gray2),
                              ),
                              contentPadding: const EdgeInsets.all(15),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _selectedDate != 'Tanggal Pengeluaran'
                                        ? Jiffy.parse(_selectedDate).format(
                                            pattern: 'EEEE, dd MMMM yyyy')
                                        : _selectedDate,
                                    style:
                                        _selectedDate != 'Tanggal Pengeluaran'
                                            ? getBlackTextStyle()
                                            : getGrayTextStyle(),
                                  ),
                                ),
                                Image.asset('assets/images/calendar.png')
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ThousandsFormatter(
                                formatter: formatThousandsNumber),
                            CurrencyInputFormatter(),
                          ],
                          decoration: getInputDecoration(hintText: 'Nominal'),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: _isButtonEnabled()
                                ? btnPrimaryStyle
                                : btnDisabledStyle,
                            onPressed: () {
                              if (_isButtonEnabled()) {
                                _saveExpense();
                              }
                            },
                            child: Text(
                              'Simpan',
                              style: getWhiteTextStyle(
                                fontWeight: FontWeighManager.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
