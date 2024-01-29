// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int id;
  final String firstname;
  final String lastname;
  final String dob;
  final String email;
  final dynamic username;
  final dynamic pharmacyId;
  final dynamic pharmacyBranchId;
  final String phoneNumber;
  final dynamic status;
  final String memberId;
  final dynamic address;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic image;
  final String profilePicture;
  final dynamic branchId;
  final String fullname;
  final int moneySaved;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.email,
    required this.username,
    required this.pharmacyId,
    required this.pharmacyBranchId,
    required this.phoneNumber,
    required this.status,
    required this.memberId,
    required this.address,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.profilePicture,
    required this.branchId,
    required this.fullname,
    required this.moneySaved,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        dob: json["dob"],
        email: json["email"],
        username: json["username"],
        pharmacyId: json["pharmacy_id"],
        pharmacyBranchId: json["pharmacy_branch_id"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        memberId: json["member_id"],
        address: json["address"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        profilePicture: json["profile_picture"],
        branchId: json["branch_id"],
        fullname: json["fullname"],
        moneySaved: json["money_saved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "dob": dob,
        "email": email,
        "username": username,
        "pharmacy_id": pharmacyId,
        "pharmacy_branch_id": pharmacyBranchId,
        "phone_number": phoneNumber,
        "status": status,
        "member_id": memberId,
        "address": address,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "profile_picture": profilePicture,
        "branch_id": branchId,
        "fullname": fullname,
        "money_saved": moneySaved,
      };
}

class AuthData {
  UserModel? user;
  dynamic other;

  AuthData({
    required this.other,
    required this.user,
  });
}
