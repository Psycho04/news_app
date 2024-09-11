import 'package:flutter/material.dart';

class Category {
  String categoryId;
  String title;
  String imagePath;
  bool isLeftSided;
  Color backgroundColor;

  Category(
      {required this.categoryId,
      required this.title,
      required this.imagePath,
      required this.isLeftSided,
      required this.backgroundColor});

  static List<Category> categories = [
    Category(
        categoryId: 'sports',
        title: 'Sports',
        imagePath: 'assets/images/sports.png',
        isLeftSided: true,
        backgroundColor: const Color(0xffC91C22)),
    Category(
        categoryId: 'technology',
        title: 'Politics',
        imagePath: 'assets/images/Politics.png',
        isLeftSided: false,
        backgroundColor: const Color(0xff003E90)),
    Category(
        categoryId: 'health',
        title: 'Health',
        imagePath: 'assets/images/health.png',
        isLeftSided: true,
        backgroundColor: const Color(0xffED1E79)),
    Category(
        categoryId: 'business',
        title: 'Business',
        imagePath: 'assets/images/business.png',
        isLeftSided: false,
        backgroundColor: const Color(0xffCF7E48)),
    Category(
        categoryId: 'entertainment',
        title: 'Environment',
        imagePath: 'assets/images/environment.png',
        isLeftSided: true,
        backgroundColor: const Color(0xff4882CF)),
    Category(
        categoryId: 'science',
        title: 'Science',
        imagePath: 'assets/images/science.png',
        isLeftSided: false,
        backgroundColor: const Color(0xffF2D352)),
  ];
}
