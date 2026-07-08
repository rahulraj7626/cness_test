import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/data/base_datasouce.dart';
import 'package:cness_test/features/profile/data/datasources/profile_datasource.dart';
import 'package:cness_test/features/profile/data/models/user_model.dart';

class ProfileDatasourceImpl extends BaseDataSource
    implements ProfileDatasource {
  @override
  Future<UserModel> getProfile() async {
    return UserModel.fromJson(await loadJson(Assets.json.profile));
  }
}
