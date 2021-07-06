class Item {
  String productID;
  String variantID;
  String qty;
  String price;
  String netPrice;
  String status;
  String addedOn;
  String productName;
  String productDescription;
  String benefit;

  Item(
      {this.productID,
        this.variantID,
        this.qty,
        this.price,
        this.netPrice,
        this.status,
        this.addedOn,
        this.productName,
        this.productDescription,
        this.benefit});

  Item.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    variantID = json['variantID'];
    qty = json['qty'];
    price = json['price'];
    netPrice = json['net_price'];
    status = json['status'];
    addedOn = json['added_on'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    benefit = json['benefit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['variantID'] = this.variantID;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['net_price'] = this.netPrice;
    data['status'] = this.status;
    data['added_on'] = this.addedOn;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['benefit'] = this.benefit;
    return data;
  }
}