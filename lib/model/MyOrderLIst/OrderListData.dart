import 'package:aov_farmage/model/MyOrderLIst/OrderListItem.dart';
class Data {
  String orderID;
  String userID;
  String deliveryCharges;
  String orderAmount;
  String totalAmount;
  String paymentMethod;
  String instruction;
  String deliveryDate;
  String deliverySlot;
  String addedOn;
  String addressId;
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
  String isActive;
  List<Item> item;

  Data(
      {this.orderID,
        this.userID,
        this.deliveryCharges,
        this.orderAmount,
        this.totalAmount,
        this.paymentMethod,
        this.instruction,
        this.deliveryDate,
        this.deliverySlot,
        this.addedOn,
        this.addressId,
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
        this.isActive,
        this.item});

  Data.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    userID = json['userID'];
    deliveryCharges = json['delivery_charges'];
    orderAmount = json['order_amount'];
    totalAmount = json['total_amount'];
    paymentMethod = json['payment_method'];
    instruction = json['instruction'];
    deliveryDate = json['delivery_date'];
    deliverySlot = json['delivery_slot'];
    addedOn = json['added_on'];
    addressId = json['address_id'];
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
    isActive = json['is_active'];
    if (json['item'] != null) {
      item = new List<Item>();
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderID'] = this.orderID;
    data['userID'] = this.userID;
    data['delivery_charges'] = this.deliveryCharges;
    data['order_amount'] = this.orderAmount;
    data['total_amount'] = this.totalAmount;
    data['payment_method'] = this.paymentMethod;
    data['instruction'] = this.instruction;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_slot'] = this.deliverySlot;
    data['added_on'] = this.addedOn;
    data['address_id'] = this.addressId;
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
    data['is_active'] = this.isActive;
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
