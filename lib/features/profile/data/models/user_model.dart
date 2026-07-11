import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final ProfileModel profile;

  @JsonKey(name: 'basic_info')
  final BasicInfoModel basicInfo;
  final ContactModel contact;
  final List<ExperienceModel> experience;
  final List<EducationModel> education;

  const UserModel({
    required this.profile,
    required this.basicInfo,
    required this.contact,
    required this.experience,
    required this.education,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class ProfileModel {
  final String name;
  final List<String> specialization;
  final String quote;

  const ProfileModel({
    required this.name,
    required this.specialization,
    required this.quote,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class BasicInfoModel {
  final List<String> interests;
  final List<String> profession;

  const BasicInfoModel({required this.interests, required this.profession});

  factory BasicInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasicInfoModelToJson(this);
}

@JsonSerializable()
class ContactModel {
  final String email;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;
  final String address;
  final String location;

  const ContactModel({
    required this.email,
    required this.countryCode,
    required this.phone,
    required this.address,
    required this.location,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}

@JsonSerializable()
class ExperienceModel {
  final String role;
  final String company;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  final String location;
  final String image;
  final List<String> responsibilities;

  const ExperienceModel({
    required this.role,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.location,
    required this.responsibilities,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
}

@JsonSerializable()
class EducationModel {
  final String course;
  final String school;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  final String location;
  final String image;
  final List<String> responsibilities;

  const EducationModel({
    required this.course,
    required this.school,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.image,
    required this.responsibilities,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) =>
      _$EducationModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationModelToJson(this);
}
