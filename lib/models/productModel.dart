//productos
class ProductModel {
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

  ProductModel(
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
