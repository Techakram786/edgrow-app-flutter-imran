import 'ProfileData.dart';

class LoginModel {
  int? id;
  String? fullName;
  String? email;
  String? mobileNumber;
  String? accessToken;
  int? isCurrentPositionUpdated;
  ProfileData? profileData;
  LoginModel(
      {this.id,
        this.fullName,
        this.email,
        this.mobileNumber,
        this.accessToken,
        this.isCurrentPositionUpdated,
        this.profileData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    accessToken = json['access_token'];
    isCurrentPositionUpdated = json['is_current_position_updated'];
    profileData = json['profile_data'] != null
        ? ProfileData.fromJson(json['profile_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['access_token'] = accessToken;
    data['is_current_position_updated'] = isCurrentPositionUpdated;
    if (profileData != null) {
      data['profile_data'] = profileData!.toJson();
    }
    return data;
  }
}