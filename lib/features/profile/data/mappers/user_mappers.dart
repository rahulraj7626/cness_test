import 'package:cness_test/features/profile/data/models/user_model.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      profile: profile.toEntity(),
      basicInfo: basicInfo.toEntity(),
      contact: contact.toEntity(),
      experience: experience.map((e) => e.toEntity()).toList(),
      education: education.map((e) => e.toEntity()).toList(),
    );
  }
}

extension ProfileModelMapper on ProfileModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      name: name,
      specialization: specialization,
      quote: quote,
    );
  }
}

extension BasicInfoModelMapper on BasicInfoModel {
  BasicInfoEntity toEntity() {
    return BasicInfoEntity(interests: interests, profession: profession);
  }
}

extension ContactModelMapper on ContactModel {
  ContactEntity toEntity() {
    return ContactEntity(
      email: email,
      countryCode: countryCode,
      phone: phone,
      address: address,
      location: location,
    );
  }
}

extension ExperienceModelMapper on ExperienceModel {
  ExperienceEntity toEntity() {
    return ExperienceEntity(
      role: role,
      company: company,
      startDate: startDate,
      endDate: endDate,
      location: location,
      responsibilities: responsibilities,
    );
  }
}

extension EducationModelMapper on EducationModel {
  EducationEntity toEntity() {
    return EducationEntity(
      course: course,
      school: school,
      startDate: startDate,
      endDate: endDate,
      location: location,
      responsibilities: responsibilities,
    );
  }
}
