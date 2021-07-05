class Data1{
  String cartID;
  String userID;
  String productID;
  String productName;
  String productDescription;
  String productImage;
  String use;
  String benefit;
  String variantID;
  String unitValue;
  String unit;
  String mrp;
  String price;
  String createdAt;
  String qty;
  String addedOn;

  Data1(
      {this.cartID,
        this.userID,
        this.productID,
        this.productName,
        this.productDescription,
        this.productImage,
        this.use,
        this.benefit,
        this.variantID,
        this.unitValue,
        this.unit,
        this.mrp,
        this.price,
        this.createdAt,
        this.qty,
        this.addedOn});

  Data1.fromJson(Map<String, dynamic> json) {
    cartID = json['cartID'];
    userID = json['userID'];
    productID = json['productID'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    use = json['use'];
    benefit = json['benefit'];
    variantID = json['variantID'];
    unitValue = json['unit_value'];
    unit = json['unit'];
    mrp = json['mrp'];
    price = json['price'];
    createdAt = json['created_at'];
    qty = json['qty'];
    addedOn = json['added_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartID'] = this.cartID;
    data['userID'] = this.userID;
    data['productID'] = this.productID;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['product_image'] = this.productImage;
    data['use'] = this.use;
    data['benefit'] = this.benefit;
    data['variantID'] = this.variantID;
    data['unit_value'] = this.unitValue;
    data['unit'] = this.unit;
    data['mrp'] = this.mrp;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['qty'] = this.qty;
    data['added_on'] = this.addedOn;
    return data;
  }
}