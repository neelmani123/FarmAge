class Data {
  String slotID;
  String startTime;
  String endTime;
  String duration;

  Data({this.slotID, this.startTime, this.endTime, this.duration});

  Data.fromJson(Map<String, dynamic> json) {
    slotID = json['slotID'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slotID'] = this.slotID;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['duration'] = this.duration;
    return data;
  }
}