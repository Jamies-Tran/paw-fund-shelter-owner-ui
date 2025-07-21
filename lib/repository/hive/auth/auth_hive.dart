import 'package:hive_flutter/hive_flutter.dart';
import 'package:paw_fund_shelter_owner/repository/hive/models/auth_hive_model.dart';

abstract class IAuthHive {
  void saveAuth(AuthHive auth);
  
  AuthHive? findByAccountId(int accountId);
}

class AuthHiveImpl extends IAuthHive {
  late Box<AuthHive> authBox;

  AuthHiveImpl() {
    authBox = Hive.box("authBox");
  }

  @override
  AuthHive? findByAccountId(int accountId) {
    return authBox.get(accountId, defaultValue: null);
  }

  @override
  void saveAuth(AuthHive auth) {
    authBox.put(auth.accountId, auth);
  }
  
}