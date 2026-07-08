import 'package:cness_test/features/profile/data/models/user_model.dart';

abstract class ProfileDatasource {
  Future<UserModel> getProfile();
}
