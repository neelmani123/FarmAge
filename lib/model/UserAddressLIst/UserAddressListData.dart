class Data {
  String addressID;
  String location;
  String flatNo;
  String buildingName;
  String landmark;
  String addressType;
  String pincode;
  String latitude;
  String longitude;
  String contactPersonName;
  String contactPersonMobile;
  String note;
  String userID;
  String isActive;
  String addedOn;

  Data(
      {this.addressID,
        this.location,
        this.flatNo,
        this.buildingName,
        this.landmark,
        this.addressType,
        this.pincode,
        this.latitude,
        this.longitude,
        this.contactPersonName,
        this.contactPersonMobile,
        this.note,
        this.userID,
        this.isActive,
        this.addedOn});

  Data.fromJson(Map<String, dynamic> json) {
    addressID = json['addressID'];
    location = json['location'];
    flatNo = json['flat_no'];
    buildingName = json['building_name'];
    landmark = json['landmark'];
    addressType = json['address_type'];
    pincode = json['pincode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    contactPersonName = json['contact_person_name'];
    contactPersonMobile = json['contact_person_mobile'];
    note = json['note'];
    userID = json['userID'];
    isActive = json['is_active'];
    addedOn = json['added_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressID'] = this.addressID;
    data['location'] = this.location;
    data['flat_no'] = this.flatNo;
    data['building_name'] = this.buildingName;
    data['landmark'] = this.landmark;
    data['address_type'] = this.addressType;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_mobile'] = this.contactPersonMobile;
    data['note'] = this.note;
    data['userID'] = this.userID;
    data['is_active'] = this.isActive;
    data['added_on'] = this.addedOn;
    return data;
  }
}
