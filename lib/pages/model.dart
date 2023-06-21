// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String profilePhoto;
  String uid;
  String phoneNumber;
  String createdAt;
  String bio;
  // add bio
  UserModel({
    required this.name,
    required this.profilePhoto,
    required this.uid,
    required this.phoneNumber,
    required this.createdAt,
    required this.bio,
  });
  // mapping from firebase
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"] ?? " ",
      uid: map["uid"] ?? " ",
      profilePhoto: map["profilePhoto"] ?? " ",
      phoneNumber: map["phoneNumber"] ?? " ",
      createdAt: map["createdAt"] ?? " ",
      bio: map["bio"] ?? " ",
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
      'bio': bio,
    };
  }
}
