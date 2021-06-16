class Category {
  //propiedades del producto
  int id;

  String name;

  bool stockable;

  double comissionPercentage;

  //constructor
  Category(this.id, this.name, this.comissionPercentage, this.stockable);
}

class Subcategory {
  int id;

  String name;

  int categoryId;

  //constructor
  Subcategory(this.id, this.name, this.categoryId);
}

//productos
class Product {
  String id,
      companyId,
      subcategoryId,
      brandId,
      price,
      offerPrice,
      wholersalersPrice,
      name,
      barcode,
      description,
      image;

  Product(
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.offerPrice,
    this.wholersalersPrice,
    this.subcategoryId,
    this.barcode,
    this.companyId,
    this.brandId,
  );
}
