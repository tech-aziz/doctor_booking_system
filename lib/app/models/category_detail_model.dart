class CategoryModel {
  String title;
  String icon;

  CategoryModel({
    required this.title,
    required this.icon,
  });
}

List<CategoryModel> getCategoryData = [
  CategoryModel(
    title: 'ডাক্তার এপয়েন্টমেন্ট',
    icon: 'assets/images/doctor_appoinment.svg',
  ),
  CategoryModel(title: 'ব্রাঞ্চ', icon: 'assets/images/location.svg'),
  CategoryModel(title: 'যোগাযোগ', icon: 'assets/images/communication.svg'),
  CategoryModel(title: 'ডাক্তার সম্পর্কে', icon: 'assets/images/about.svg'),
];
