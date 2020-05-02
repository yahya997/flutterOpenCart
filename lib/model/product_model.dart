class ProductModel{
  String product_id,thumb,name,status,price_excluding_tax,price_excluding_tax_formated,price_formated,rating,description;
  int quantity ;
  String price ;

  ProductModel(this.product_id, this.thumb, this.name, this.quantity,
      this.status, this.price_excluding_tax,
      this.price_excluding_tax_formated, this.price, this.price_formated,
      this.rating, this.description);


}