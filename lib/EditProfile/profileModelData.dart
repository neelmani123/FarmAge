class Data {
  String id;
  String name;
  String email;
  String status;
  String phone;
  Null image;
  String gender;
  String wallet;
  String referralCode;
  String addedOn;
  Null updatedOn;

  Data(
      {this.id,
        this.name,
        this.email,
        this.status,
        this.phone,
        this.image,
        this.gender,
        this.wallet,
        this.referralCode,
        this.addedOn,
        this.updatedOn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    phone = json['phone'];
    image = json['image'];
    gender = json['gender'];
    wallet = json['wallet'];
    referralCode = json['referral_code'];
    addedOn = json['added_on'];
    updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['wallet'] = this.wallet;
    data['referral_code'] = this.referralCode;
    data['added_on'] = this.addedOn;
    data['updated_on'] = this.updatedOn;
    return data;
  }
}
