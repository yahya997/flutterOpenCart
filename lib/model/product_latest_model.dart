
class ProductLatestModelList{

  List<ProductLatestModel> products;

  ProductLatestModelList({this.products});

  ProductLatestModelList.fromJson(List<dynamic> parsedJson) {
    if (parsedJson != null) {
      products = List<ProductLatestModel>();
      products = parsedJson.map((i) => ProductLatestModel.fromJson(i)).toList();
    }
  }
}

class ProductLatestModel {
  var productId;
  var thumb;
  var name;
  var quantity;
  var status;
  var stockStatus;
  var priceExcludingTax;
  var priceExcludingTaxFormated;
  var price;
  var priceFormated;
  var special;
  var specialFormated;
  var specialExcludingTax;
  var specialExcludingTaxFormated;
  var rating;
  var description;

  ProductLatestModel(
      {this.productId,
        this.thumb,
        this.name,
        this.quantity,
        this.status,
        this.stockStatus,
        this.priceExcludingTax,
        this.priceExcludingTaxFormated,
        this.price,
        this.priceFormated,
        this.special,
        this.specialFormated,
        this.specialExcludingTax,
        this.specialExcludingTaxFormated,
        this.rating,
        this.description});

  ProductLatestModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    quantity = json['quantity'];
    status = json['status'];
    stockStatus = json['stock_status'];
    priceExcludingTax = json['price_excluding_tax'];
    priceExcludingTaxFormated = json['price_excluding_tax_formated'];
    price = json['price'];
    priceFormated = json['price_formated'];
    special = json['special'];
    specialFormated = json['special_formated'];
    specialExcludingTax = json['special_excluding_tax'];
    specialExcludingTaxFormated = json['special_excluding_tax_formated'];
    rating = json['rating'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['stock_status'] = this.stockStatus;
    data['price_excluding_tax'] = this.priceExcludingTax;
    data['price_excluding_tax_formated'] = this.priceExcludingTaxFormated;
    data['price'] = this.price;
    data['price_formated'] = this.priceFormated;
    data['special'] = this.special;
    data['special_formated'] = this.specialFormated;
    data['special_excluding_tax'] = this.specialExcludingTax;
    data['special_excluding_tax_formated'] = this.specialExcludingTaxFormated;
    data['rating'] = this.rating;
    data['description'] = this.description;
    return data;
  }
}
