import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/popular_model.dart';
import 'widgets/categories_section.dart';
import 'widgets/diet_recommendation_section.dart';
import 'widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PopularDietsModel> popularDiets = PopularDietsModel.getPopularDiets();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Breakfast', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xffF7F8F8), borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg', height: 20, width: 20),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 37,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: const Color(0xffF7F8F8), borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset('assets/icons/dots.svg', height: 5, width: 5),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SearchField(),
            const SizedBox(height: 40),
            const CategoriesSection(),
            const SizedBox(height: 40),
            const DietRecommendationSection(),
            const SizedBox(height: 40),
            LayoutBuilder(builder: (_, BoxConstraints constraints){
              final bool isSmallScreen = constraints.maxWidth < 600;
              return Column(
                crossAxisAlignment: isSmallScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(left: 20), child: Text('Popular', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
                  const SizedBox(height: 15),
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext ctx, int idx) {
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: popularDiets[idx].boxIsSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: popularDiets[idx].boxIsSelected ? <BoxShadow>[BoxShadow(color: const Color(0xff1D1617).withValues(alpha: 0.07), offset: const Offset(0, 10), blurRadius: 40, spreadRadius: 0)] : <BoxShadow>[],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SvgPicture.asset(popularDiets[idx].iconPath, width: 65, height: 65),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(popularDiets[idx].name, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
                                  Text('${popularDiets[idx].level} | ${popularDiets[idx].duration} | ${popularDiets[idx].calorie}', style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xff7B6F72), fontSize: 13)),
                                ],
                              ),
                              GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/button.svg', width: 30, height: 30)),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext ctx, int idx) => const SizedBox(height: 25),
                    itemCount: popularDiets.length,
                  ),
                ],
              );
            }),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget _searchField() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
  //     decoration: BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: const Color(0xff1D1617).withValues(alpha: 0.11), blurRadius: 40, spreadRadius: 0.0)]),
  //     child: TextField(
  //       decoration: InputDecoration(
  //         filled: true,
  //         fillColor: Colors.white,
  //         contentPadding: const EdgeInsets.all(15),
  //         hintText: 'Search Pancake',
  //         hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
  //         prefixIcon: Padding(padding: const EdgeInsets.all(12), child: SvgPicture.asset('assets/icons/Search.svg')),
  //         suffixIcon: SizedBox(
  //           width: 100,
  //           child: IntrinsicHeight(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: <Widget>[const VerticalDivider(color: Colors.black, thickness: 0.1, indent: 10, endIndent: 10), Padding(padding: const EdgeInsets.all(8), child: SvgPicture.asset('assets/icons/Filter.svg'))],
  //             ),
  //           ),
  //         ),
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
  //       ),
  //     ),
  //   );
  // }

  // Widget _categoriesSection() {
  //   final List<CategoryModel> categories = CategoryModel.getCategories();
  //   return LayoutBuilder(
  //     builder: (_, BoxConstraints constraints) {
  //       final bool isSmallScreen = constraints.maxWidth < 600;
  //       return isSmallScreen
  //           ? Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               const Padding(padding: EdgeInsets.only(left: 20), child: Text('Category', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
  //               const SizedBox(height: 15),
  //               SizedBox(
  //                 height: 120,
  //                 child: ListView.separated(
  //                   itemCount: categories.length,
  //                   scrollDirection: Axis.horizontal,
  //                   padding: const EdgeInsets.symmetric(horizontal: 20),
  //                   separatorBuilder: (BuildContext ctx, int idx) => const SizedBox(width: 25),
  //                   itemBuilder: (BuildContext ctx, int idx) {
  //                     return Container(
  //                       width: 100,
  //                       decoration: BoxDecoration(color: categories[idx].boxColor.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(16)),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: <Widget>[
  //                           Container(width: 50, height: 50, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(categories[idx].iconPath))),
  //                           Text(categories[idx].name, style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14)),
  //                         ],
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ],
  //           )
  //           : Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               const Padding(padding: EdgeInsets.only(left: 20), child: Text('Category', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
  //               const SizedBox(height: 15),
  //               SizedBox(
  //                 height: 120,
  //                 child: SizedBox(
  //                   width: (categories.length * 100) + ((categories.length) * 25),
  //                   child: ListView.separated(
  //                     itemCount: categories.length,
  //                     scrollDirection: Axis.horizontal,
  //                     padding: const EdgeInsets.symmetric(horizontal: 20),
  //                     separatorBuilder: (BuildContext ctx, int idx) => const SizedBox(width: 25),
  //                     itemBuilder: (BuildContext ctx, int idx) {
  //                       return Container(
  //                         width: 100,
  //                         decoration: BoxDecoration(color: categories[idx].boxColor.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(16)),
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                           children: <Widget>[
  //                             Container(width: 50, height: 50, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(categories[idx].iconPath))),
  //                             Text(categories[idx].name, style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14)),
  //                           ],
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           );
  //     },
  //   );
  // }

  // Widget _dietRecommendationSection() {
  //   final List<DietModel> diets = DietModel.getDiets();
  //   return LayoutBuilder(builder: (_, BoxConstraints constraints){
  //     final bool isSmallScreen = constraints.maxWidth < 600;
  //     return isSmallScreen? Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         const Padding(padding: EdgeInsets.only(left: 20), child: Text('Recommendation\nfor Diet', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
  //         const SizedBox(height: 15),
  //         SizedBox(
  //           height: 240,
  //           child: ListView.separated(
  //             itemBuilder: (BuildContext ctx, int idx) {
  //               return Container(
  //                 width: 210,
  //                 decoration: BoxDecoration(color: diets[idx].boxColor.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(20)),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: <Widget>[
  //                     SvgPicture.asset(diets[idx].iconPath),
  //                     Column(
  //                       children: <Widget>[
  //                         Text(diets[idx].name, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
  //                         Text('${diets[idx].level} | ${diets[idx].duration} | ${diets[idx].calorie}', style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xff7B6F72), fontSize: 13)),
  //                       ],
  //                     ),
  //                     Container(
  //                       height: 45,
  //                       width: 130,
  //                       decoration: BoxDecoration(
  //                         gradient: LinearGradient(colors: <Color>[diets[idx].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent, diets[idx].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent]),
  //                         borderRadius: BorderRadius.circular(50),
  //                       ),
  //                       child: Center(child: Text('View', style: TextStyle(color: diets[idx].viewIsSelected ? Colors.white : const Color(0xffC58BF2), fontWeight: FontWeight.w600, fontSize: 14))),
  //                     ),
  //                   ],
  //                 ),
  //               );
  //             },
  //             separatorBuilder: (_, __) => const SizedBox(width: 25),
  //             itemCount: diets.length,
  //             scrollDirection: Axis.horizontal,
  //             padding: const EdgeInsets.symmetric(horizontal: 20),
  //           ),
  //         ),
  //       ],
  //     ):Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //         const Padding(padding: EdgeInsets.only(left: 20), child: Text('Recommendation for Diet', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
  //         const SizedBox(height: 15),
  //         SizedBox(
  //           height: 240,
  //           child: Center(
  //             child: SizedBox(
  //               width: (diets.length * 210) + ((diets.length) * 25),
  //               child: ListView.separated(
  //                 itemBuilder: (BuildContext ctx, int idx) {
  //                   return Container(
  //                     width: 210,
  //                     decoration: BoxDecoration(color: diets[idx].boxColor.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(20)),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: <Widget>[
  //                         SvgPicture.asset(diets[idx].iconPath),
  //                         Column(
  //                           children: <Widget>[
  //                             Text(diets[idx].name, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
  //                             Text('${diets[idx].level} | ${diets[idx].duration} | ${diets[idx].calorie}', style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xff7B6F72), fontSize: 13)),
  //                           ],
  //                         ),
  //                         Container(
  //                           height: 45,
  //                           width: 130,
  //                           decoration: BoxDecoration(
  //                             gradient: LinearGradient(colors: <Color>[diets[idx].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent, diets[idx].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent]),
  //                             borderRadius: BorderRadius.circular(50),
  //                           ),
  //                           child: Center(child: Text('View', style: TextStyle(color: diets[idx].viewIsSelected ? Colors.white : const Color(0xffC58BF2), fontWeight: FontWeight.w600, fontSize: 14))),
  //                         ),
  //                       ],
  //                     ),
  //                   );
  //                 },
  //                 separatorBuilder: (_, __) => const SizedBox(width: 25),
  //                 itemCount: diets.length,
  //                 scrollDirection: Axis.horizontal,
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     );
  //   });
  // }
}
