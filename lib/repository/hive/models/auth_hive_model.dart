import 'package:hive/hive.dart';
import 'package:paw_fund_shelter_owner/repository/api/models/login_info/login_info_model.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: authType)
class AuthHive {
  @HiveField(0)
  int accountId;

  @HiveField(1)
  String accessToken;

  @HiveField(2)
  String refreshToken;

  @HiveField(3)
  List<Role>? roles;

  @HiveField(4)
  double? latitude;

  @HiveField(5)
  double? longitude;
  
  AuthHive({
    required this.accountId,
    required this.accessToken,
    required this.refreshToken,
    this.roles,
    this.latitude,
    this.longitude
  });
}

