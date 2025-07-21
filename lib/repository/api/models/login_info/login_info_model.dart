import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

class LoginInfo {
  final int? loginInfoId;
  final String? accessToken;
  final String? refreshToken;
  final DateTime? accessExpiredAt;
  final DateTime? refreshExpiredAt;
  final double? latitude;
  final double? longitude;
  final LoginAccount? account;


  LoginInfo({
    this.loginInfoId,
    this.accessToken,
    this.refreshToken,
    this.accessExpiredAt,
    this.refreshExpiredAt,
    this.latitude,
    this.longitude,
    this.account
  });
  
  Map<String, dynamic> toJson() => {
    "loginInfoId": loginInfoId,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "accessExpiredAt": PDateTimeUtils.parseString(accessExpiredAt),
    "refreshExpiredAt": PDateTimeUtils.parseString(refreshExpiredAt),
    "latitude": latitude,
    "longitude": longitude,
    "account": account?.toJson()
  };
  
  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
    loginInfoId: json["loginInfoId"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    accessExpiredAt: PDateTimeUtils.parseDateTime(json["accessExpiredAt"]),
    refreshExpiredAt: PDateTimeUtils.parseDateTime(json["refreshExpiredAt"]),
    latitude: json["latitude"],
    longitude: json["longitude"],
    account: LoginAccount.fromJson(json["account"])
  );
}

class LoginAccount {
  final int? accountId;
  final String? email;
  final String? statusCode;
  final List<Role>? roles;

  LoginAccount({
    this.accountId,
    this.email,
    this.statusCode,
    this.roles
  });

  Map<String, dynamic> toJson() => {
    "accountId": accountId,
    "email": email,
    "statusCode": statusCode,
    "roles": roles?.map((role) => role.toJson()).toList()
  };

  factory LoginAccount.fromJson(Map<String, dynamic> json) => LoginAccount(
    accountId: json["accountId"],
    email: json["email"],
    roles: (json["roles"] as List<dynamic>)
        .map((role) => Role.fromJson(role)).toList()
  );

}

class Role {
  final int? roleId;
  final String? roleCode;
  final String? roleName;

  Role({
    this.roleId,
    this.roleCode,
    this.roleName
  });

  Map<String, dynamic> toJson() => {
    "roleId": roleId,
    "roleCode": roleCode,
    "roleName": roleName
  };

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    roleId: json["roleId"],
    roleCode: json["roleCode"],
    roleName: json["roleName"]
  );
}