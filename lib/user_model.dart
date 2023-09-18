// ignore_for_file: non_constant_identifier_names

class UserModel {
  String name;
  String city;
  String address;
  String phoneNumber;
  String uid;
  String createdAt;

  UserModel({
    required this.name,
    required this.city,
    required this.address,
    required this.phoneNumber,
    required this.uid,
    required this.createdAt,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      city: map['city']??'',
      name: map['name']??'',
      address: map['address']??'',
      uid: map['uid'] ?? '',
      phoneNumber: map['phone Number'] ?? '',
      createdAt :map['createdAt']??'',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name":name,
      "city":city,
      "address":address,
      "uid": uid,
      "phoneNumber": phoneNumber,
      "created At":createdAt
    };
  }
}
