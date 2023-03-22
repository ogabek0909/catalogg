class Product {
  final int id;
  final String name;
  final int company;
  final int subCategory;
  final List productImages;
  Product({
    required this.id,
    required this.name,
    required this.productImages,
    required this.subCategory,
    required this.company,
  });

  factory Product.getProduct(Map data) {
    return Product(
      id: data['id'],
      name: data['name'],
      productImages: data['productimages'],
      subCategory: data['subcategory'],
      company: data['company'],
    );
  }
}
