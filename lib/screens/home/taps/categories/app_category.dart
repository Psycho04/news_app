import 'package:flutter/material.dart';
import 'package:news_app/data/model/category.dart';

class AppCategory extends StatelessWidget {
  final Category category;
  const AppCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(24),
          topRight: const Radius.circular(24),
          bottomLeft: Radius.circular(category.isLeftSided ? 24 : 0),
          bottomRight: Radius.circular(category.isLeftSided ? 0 : 24),
        )
      ),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          Text(
            category.title,
            style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}