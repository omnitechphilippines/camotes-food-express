import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/diet_model.dart';

class DietRecommendationSection extends StatelessWidget {
  const DietRecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DietModel> diets = DietModel.getDiets();

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        final bool isSmallScreen = constraints.maxWidth < 600;
        return Column(
          crossAxisAlignment: isSmallScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Recommendation for Diet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 240,
              width: isSmallScreen ? null : (diets.length * 210) + ((diets.length) * 25),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: diets.length,
                separatorBuilder: (_, __) => const SizedBox(width: 25),
                itemBuilder: (_, int idx) {
                  final DietModel diet = diets[idx];
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: diet.boxColor.withAlpha(77),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SvgPicture.asset(diet.iconPath),
                        Column(
                          children: <Widget>[
                            Text(diet.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            Text('${diet.level} | ${diet.duration} | ${diet.calorie}', style: const TextStyle(fontSize: 13, color: Color(0xff7B6F72))),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              diet.viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                              diet.viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                            ]),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: diet.viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
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
