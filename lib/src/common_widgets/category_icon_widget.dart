import 'package:flutter/material.dart';

class CategoryIconWidget extends StatelessWidget {
  final Color color;
  final String images;
  const CategoryIconWidget({
    super.key,
    required this.color,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        images,
      ),
    );
  }
}
