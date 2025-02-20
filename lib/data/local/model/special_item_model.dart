import 'dart:ui';

class SpecialItemModel{
  String image;
  String name;
  num amount;
  Color firstColor;
  Color secondColor;
  Color thirdColor;

  SpecialItemModel(
      {required this.image,
      required this.name,
      required this.amount,
      required this.firstColor,
      required this.secondColor,
      required this.thirdColor});
}