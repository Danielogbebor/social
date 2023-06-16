// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String name;
  final String profilePhoto;
  final String uid;
  final String phoneNumber;
  final String createdAt;
  // add bio
  UserModel({
    required this.name,
    required this.profilePhoto,
    required this.uid,
    required this.phoneNumber,
    required this.createdAt,
  });
  // mapping from firebase
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"] ?? " ",
      createdAt: map["createdAt"] ?? " ",
      profilePhoto: map["profilePhoto"] ?? " ",
      phoneNumber: map["phoneNumber"] ?? " ",
      uid: map["uid"] ?? " ",
    );
  }
  //  mapping to firebase
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uid": uid,
      "profilePhoto": profilePhoto,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
    };
  }
}
