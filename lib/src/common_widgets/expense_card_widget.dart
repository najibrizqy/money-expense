import 'package:flutter/material.dart';
import 'package:money_expense/src/theme_manager/font_manager.dart';
import 'package:money_expense/src/theme_manager/style_manager.dart';

class ExpenseCardWidget extends StatelessWidget {
  final String title;
  final String amount;
  final Color backgroundColor;
  const ExpenseCardWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.422,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getWhiteTextStyle(
              fontSize: 14,
              fontWeight: FontWeighManager.semiBold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Rp. $amount',
            style: getWhiteTextStyle(
              fontSize: 18,
              fontWeight: FontWeighManager.bold,
            ),
          )
        ],
      ),
    );
  }
}
