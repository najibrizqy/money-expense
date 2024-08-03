import 'package:money_expense/src/features/expense/domain/category.dart';
import 'package:money_expense/src/theme_manager/color_manager.dart';

List<Category> masterCategory = [
  Category(
    title: 'Makanan',
    color: ColorManager.yellow,
    images: 'assets/images/food.png',
  ),
  Category(
    title: 'Internet',
    color: ColorManager.blue3,
    images: 'assets/images/internet.png',
  ),
  Category(
    title: 'Edukasi',
    color: ColorManager.orange,
    images: 'assets/images/education.png',
  ),
  Category(
    title: 'Hadiah',
    color: ColorManager.red,
    images: 'assets/images/gift.png',
  ),
  Category(
    title: 'Transport',
    color: ColorManager.purple,
    images: 'assets/images/car.png',
  ),
  Category(
    title: 'Belanja',
    color: ColorManager.green,
    images: 'assets/images/cart.png',
  ),
  Category(
    title: 'Alat Rumah',
    color: ColorManager.purple2,
    images: 'assets/images/home.png',
  ),
  Category(
    title: 'Olahraga',
    color: ColorManager.blue2,
    images: 'assets/images/basketball.png',
  ),
  Category(
    title: 'Hiburan',
    color: ColorManager.blue,
    images: 'assets/images/clapper.png',
  ),
];
