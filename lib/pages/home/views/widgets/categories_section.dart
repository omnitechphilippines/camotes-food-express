import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/category_model.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = CategoryModel.getCategories();

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        final bool isSmallScreen = constraints.maxWidth < 600;
        return Column(
          crossAxisAlignment: isSmallScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 120,
              width: isSmallScreen ? null : (categories.length * 100) + ((categories.length) * 25),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 25),
                itemBuilder: (_, int idx) {
                  final CategoryModel cat = categories[idx];
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: cat.boxColor.withAlpha(77),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(cat.iconPath),
                          ),
                        ),
                        Text(cat.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
