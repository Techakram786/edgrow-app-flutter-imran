class EdgrowProfileModel {
  int? id;
  String? fullName;
  String? profilePicture;
  String? mobileNumber;
  String? email;
  String? careerBrief;
  String? currentPositionName;
  String? currentPositionId;
  String? gender;
  String? cityName;
  String? cityId;
  String? stateName;
  String? stateId;
  int? profileCompletionPercentage;
  List<String>? portfolio;

  EdgrowProfileModel(
      {this.id,
        this.fullName,
        this.profilePicture,
        this.mobileNumber,
        this.email,
        this.careerBrief,
        this.currentPositionName,
        this.currentPositionId,
        this.gender,
        this.cityName,
        this.cityId,
        this.stateName,
        this.stateId,
        this.profileCompletionPercentage,
        this.portfolio});

  EdgrowProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    profilePicture = json['profile_picture'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    careerBrief = json['career_brief'];
    currentPositionName = json['current_position_name'];
    currentPositionId = json['current_position_id'];
    gender = json['gender'];
    cityName = json['city_name'];
    cityId = json['city'];
    stateName = json['state_name'];
    stateId = json['state'];
    profileCompletionPercentage = json['profile_completion_percentage'];
    portfolio = json['portfolio'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['profile_picture'] = profilePicture;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['career_brief'] = careerBrief;
    data['current_position_name'] = currentPositionName;
    data['current_position_id'] = currentPositionId;
    data['gender'] = gender;
    data['city_name'] = cityName;
    data['city'] = cityId;
    data['state_name'] = stateName;
    data['state'] = stateId;
    data['profile_completion_percentage'] = profileCompletionPercentage;
    data['portfolio'] = portfolio;
    return data;
  }
}