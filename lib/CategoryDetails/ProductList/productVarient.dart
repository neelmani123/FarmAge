class ProductsVariant {
  String id;
  String productId;
  String unitValue;
  String unit;
  String weight;
  String mrp;
  String price;
  String createdAt;

  ProductsVariant(
      {this.id,
        this.productId,
        this.unitValue,
        this.unit,
        this.weight,
        this.mrp,
        this.price,
        this.createdAt});

  ProductsVariant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    unitValue = json['unit_value'];
    unit = json['unit'];
    weight = json['weight'];
    mrp = json['mrp'];
    price = json['price'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['unit_value'] = this.unitValue;
    data['unit'] = this.unit;
    data['weight'] = this.weight;
    data['mrp'] = this.mrp;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    return data;
  }
}
