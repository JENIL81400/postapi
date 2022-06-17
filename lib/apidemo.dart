
class apidemo {
  int? status;
  String? message;
  List<Data>? data;

  apidemo({this.status, this.message, this.data});

  apidemo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? addressType;
  String? address;
  String? lat;
  String? lang;
  String? landmark;
  String? building;
  String? pincode;
  String? deliveryCharge;

  Data(
      {this.id,
        this.userId,
        this.addressType,
        this.address,
        this.lat,
        this.lang,
        this.landmark,
        this.building,
        this.pincode,
        this.deliveryCharge});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressType = json['address_type'];
    address = json['address'];
    lat = json['lat'];
    lang = json['lang'];
    landmark = json['landmark'];
    building = json['building'];
    pincode = json['pincode'];
    deliveryCharge = json['delivery_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_type'] = this.addressType;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    data['landmark'] = this.landmark;
    data['building'] = this.building;
    data['pincode'] = this.pincode;
    data['delivery_charge'] = this.deliveryCharge;
    return data;
  }
}
