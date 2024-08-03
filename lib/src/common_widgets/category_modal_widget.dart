import 'package:flutter/material.dart';
import 'package:money_expense/src/common_widgets/category_icon_widget.dart';
import 'package:money_expense/src/features/expense/data/master_category.dart';
import 'package:money_expense/src/features/expense/domain/category.dart';
import 'package:money_expense/src/theme_manager/font_manager.dart';
import 'package:money_expense/src/theme_manager/style_manager.dart';

class CategoryModalWidget extends StatelessWidget {
  final Function(Category category) onCategorySelected;
  const CategoryModalWidget({
    super.key,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 385,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilih Kategori',
                  style: getBlack2TextStyle(
                    fontWeight: FontWeighManager.semiBold,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/close.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 1.5,
              ),
              itemCount: masterCategory.length,
              itemBuilder: (context, index) {
                final category = masterCategory[index];
                return InkWell(
                  onTap: () {
                    onCategorySelected(category);
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CategoryIconWidget(
                        color: category.color,
                        images: category.images,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.title,
                        style: getGrayTextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
