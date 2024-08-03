import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_expense/src/theme_manager/color_manager.dart';
import 'package:money_expense/src/theme_manager/font_manager.dart';
import 'package:money_expense/src/theme_manager/style_manager.dart';

class HistoryCardWidget extends StatelessWidget {
  final String title;
  final int amount;
  final Color iconColor;
  final String images;
  const HistoryCardWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.iconColor,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            images,
            color: iconColor,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: getBlackTextStyle(),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                      .format(amount),
                  style: getBlackTextStyle(
                    fontWeight: FontWeighManager.semiBold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
