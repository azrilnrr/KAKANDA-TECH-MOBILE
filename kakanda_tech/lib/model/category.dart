class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Web Development',
    noOfCourses: 2,
    thumbnail: 'assets/icons/Web.png',
  ),
  Category(
    name: 'Mobile Development',
    noOfCourses: 1,
    thumbnail: 'assets/icons/Mobile.png',
  ),
  Category(
    name: 'Seo Content Writer',
    noOfCourses: 2,
    thumbnail: 'assets/icons/Seo.png',
  ),
];
