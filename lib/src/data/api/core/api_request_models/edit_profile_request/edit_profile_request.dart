class EditProfileRequest {
  EditProfileRequest({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.weight, 
      this.goal, 
      this.activityLevel,});

  EditProfileRequest.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    weight = json['weight'];
    goal = json['goal'];
    activityLevel = json['activityLevel'];
  }
  String? firstName;
  String? lastName;
  String? email;
  num? weight;
  String? goal;
  String? activityLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['weight'] = weight;
    map['goal'] = goal;
    map['activityLevel'] = activityLevel;
    return map;
  }

}