
class Login {
  bool status;
  String message;
  String type;

  Login({this.status, this.message,this.type});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    type=json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['type']=this.type;
    return data;
  }
}