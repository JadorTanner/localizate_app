class Category {
  //propiedades del producto
  int id;

  String name;

  bool stockable;

  double comission_percent;

  //constructor
  Category(this.id, this.name, this.comission_percent, this.stockable);
}

class Subcategory {
  int id;

  String name;

  int category_id;

  //constructor
  Subcategory(this.id, this.name, this.category_id);
}

//productos
class Product {
  String id,
      company_id,
      subcategory_id,
      brand_id,
      price,
      offer_price,
      wholersalers_price,
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
    this.offer_price,
    this.wholersalers_price,
    this.subcategory_id,
    this.barcode,
    this.company_id,
    this.brand_id,
  );
}
