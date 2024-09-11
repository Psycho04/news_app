import 'package:flutter/material.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/screens/home/taps/categories/app_category.dart';

class CategoriesTap extends StatelessWidget {
  final Function(Category) onCategoryClick;
  const CategoriesTap(this.onCategoryClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pick Your Category\nOf Interest',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xff4F5A69)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: GridView.builder(
                itemCount: Category.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 20,
                    childAspectRatio: 148 / 171),
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      onCategoryClick(Category.categories[index]);
                    },
                    child: AppCategory(category: Category.categories[index])),
              ),
            ),
          )
        ],
      ),
    );
  }
}
