class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/corona.png',
      titleTxt: 'Corona',
      meals: <String>['Case Details' , 'of Corona'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/dengue.png',
      titleTxt: 'Dengue',
      meals: <String>['Case Details', 'of Dengue'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/malaria.png',
      titleTxt: 'Malaria',
      meals: <String>['Case Details', 'of Malaria'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),

  ];
}
