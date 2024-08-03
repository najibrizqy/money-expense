import 'package:flutter/material.dart';
import 'package:money_expense/src/common_widgets/category_icon_widget.dart';
import 'package:money_expense/src/theme_manager/color_manager.dart';
import 'package:money_expense/src/theme_manager/font_manager.dart';
import 'package:money_expense/src/theme_manager/style_manager.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final String amount;
  final Color iconColor;
  final String images;
  const CategoryCardWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.iconColor,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      margin: const EdgeInsets.only(left: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryIconWidget(
            color: iconColor,
            images: images,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: getGrayTextStyle(fontSize: 12),
          ),
          const SizedBox(height: 10),
          Text(
            'Rp. $amount',
            style: getBlackTextStyle(
              fontSize: 12,
              fontWeight: FontWeighManager.bold,
            ),
          ),
        ],
      ),
    );
  }
}
