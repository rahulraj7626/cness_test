// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
  basicInfo: BasicInfoModel.fromJson(
    json['basic_info'] as Map<String, dynamic>,
  ),
  contact: ContactModel.fromJson(json['contact'] as Map<String, dynamic>),
  experience: (json['experience'] as List<dynamic>)
      .map((e) => ExperienceModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  education: (json['education'] as List<dynamic>)
      .map((e) => EducationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'profile': instance.profile.toJson(),
  'basic_info': instance.basicInfo.toJson(),
  'contact': instance.contact.toJson(),
  'experience': instance.experience.map((e) => e.toJson()).toList(),
  'education': instance.education.map((e) => e.toJson()).toList(),
};

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  name: json['name'] as String,
  specialization: (json['specialization'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  quote: json['quote'] as String,
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'specialization': instance.specialization,
      'quote': instance.quote,
    };

BasicInfoModel _$BasicInfoModelFromJson(Map<String, dynamic> json) =>
    BasicInfoModel(
      interests: (json['interests'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      profession: (json['profession'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BasicInfoModelToJson(BasicInfoModel instance) =>
    <String, dynamic>{
      'interests': instance.interests,
      'profession': instance.profession,
    };

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
  email: json['email'] as String,
  countryCode: json['country_code'] as String,
  phone: json['phone'] as String,
  address: json['address'] as String,
  location: json['location'] as String,
);

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'country_code': instance.countryCode,
      'phone': instance.phone,
      'address': instance.address,
      'location': instance.location,
    };

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) =>
    ExperienceModel(
      role: json['role'] as String,
      company: json['company'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      image: json['image'] as String,
      location: json['location'] as String,
      responsibilities: (json['responsibilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'role': instance.role,
      'company': instance.company,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'location': instance.location,
      'image': instance.image,
      'responsibilities': instance.responsibilities,
    };

EducationModel _$EducationModelFromJson(Map<String, dynamic> json) =>
    EducationModel(
      course: json['course'] as String,
      school: json['school'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
      responsibilities: (json['responsibilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$EducationModelToJson(EducationModel instance) =>
    <String, dynamic>{
      'course': instance.course,
      'school': instance.school,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'location': instance.location,
      'image': instance.image,
      'responsibilities': instance.responsibilities,
    };
