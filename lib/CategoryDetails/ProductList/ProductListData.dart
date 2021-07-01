import 'package:aov_farmage/CategoryDetails/ProductList/productVarient.dart';

class Data {
  String productID;
  String categoryId;
  String catName;
  String productName;
  String productDescription;
  String use;
  String benefit;
  String productImage;
  List<ProductsVariant> productsVariant;

  Data(
      {this.productID,
        this.categoryId,
        this.catName,
        this.productName,
        this.productDescription,
        this.use,
        this.benefit,
        this.productImage,
        this.productsVariant});

  Data.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    categoryId = json['category_id'];
    catName = json['cat_name'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    use = json['use'];
    benefit = json['benefit'];
    productImage = json['product_image'];
    if (json['products_variant'] != null) {
      productsVariant = new List<ProductsVariant>();
      json['products_variant'].forEach((v) {
        productsVariant.add(new ProductsVariant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['category_id'] = this.categoryId;
    data['cat_name'] = this.catName;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['use'] = this.use;
    data['benefit'] = this.benefit;
    data['product_image'] = this.productImage;
    if (this.productsVariant != null) {
      data['products_variant'] =
          this.productsVariant.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

