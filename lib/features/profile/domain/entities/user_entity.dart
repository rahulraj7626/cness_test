class UserEntity {
  final ProfileEntity profile;
  final BasicInfoEntity basicInfo;
  final ContactEntity contact;
  final List<ExperienceEntity> experience;
  final List<EducationEntity> education;

  const UserEntity({
    required this.profile,
    required this.basicInfo,
    required this.contact,
    required this.experience,
    required this.education,
  });
}

class ProfileEntity {
  final String name;
  final List<String> specialization;
  final String quote;

  const ProfileEntity({
    required this.name,
    required this.specialization,
    required this.quote,
  });
}

class BasicInfoEntity {
  final List<String> interests;
  final List<String> profession;

  const BasicInfoEntity({required this.interests, required this.profession});
}

class ContactEntity {
  final String email;
  final String countryCode;
  final String phone;
  final String address;
  final String location;

  const ContactEntity({
    required this.email,
    required this.countryCode,
    required this.phone,
    required this.address,
    required this.location,
  });
}

class ExperienceEntity {
  final String role;
  final String company;
  final String startDate;
  final String endDate;
  final String location;
  final List<String> responsibilities;

  const ExperienceEntity({
    required this.role,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.responsibilities,
  });
}

class EducationEntity {
  final String course;
  final String school;
  final String startDate;
  final String endDate;
  final String location;
  final List<String> responsibilities;

  const EducationEntity({
    required this.course,
    required this.school,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.responsibilities,
  });
}
