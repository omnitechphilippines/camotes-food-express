class PopularDietsModel {
  String name, iconPath, level, duration, calorie;
  bool boxIsSelected;

  PopularDietsModel({required this.name, required this.iconPath, required this.level, required this.duration, required this.calorie, required this.boxIsSelected});

  static List<PopularDietsModel> getPopularDiets() {
    final List<PopularDietsModel> popularDiets = <PopularDietsModel>[];
    popularDiets.add(PopularDietsModel(name: 'Blueberry Pancake', iconPath: 'assets/icons/blueberry-pancake.svg', level: 'Medium', duration: '30mins', calorie: '230kCal', boxIsSelected: true));
    popularDiets.add(PopularDietsModel(name: 'Salmon Nigiri', iconPath: 'assets/icons/salmon-nigiri.svg', level: 'Easy', duration: '20mins', calorie: '120kCal', boxIsSelected: false));
    return popularDiets;
  }
}
