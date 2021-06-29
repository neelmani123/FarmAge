class Data {
  String categoryID;
  String title;
  String status;
  String image;

  Data({this.categoryID, this.title, this.status, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    categoryID = json['categoryID'];
    title = json['title'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryID'] = this.categoryID;
    data['title'] = this.title;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
}


