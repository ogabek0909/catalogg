class Category {
  final String name;
  final int id;
  final String littleImage;
  final String bigImage;

  Category({
    required this.name,
    required this.id,
    required this.littleImage,
    required this.bigImage,
  });

  factory Category.getCategory(Map data) {    
    return Category(
      name: data['name'],
      id: data['id'],
      littleImage: data['little_image'],
      bigImage: data['big_image'],
    );    
  }
}
