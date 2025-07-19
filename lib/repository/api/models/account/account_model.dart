import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

class Account {
  final int? accountId;

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;

  final String? avatar;
  final String? identification;
  final String? address;

  final DateTime? dateOfBirth;

  final String? genderCode;
  final String? genderName;

  final List<Media>? medias;

  const Account({
    this.accountId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,

    this.avatar,
    this.identification,
    this.address,

    this.dateOfBirth,

    this.genderCode,
    this.genderName,

    this.medias
  });

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "password": password,

    "avatar": avatar,
    "identification": identification,
    "address": address,

    "dateOfBirth": PDateTimeUtils.parseString(dateOfBirth),

    "genderCode": genderCode,
    "genderName": genderName,

    "medias": medias?.map((media) => media.toJson(),).toList()
  };

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        accountId: json['accountId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phone: json['phone'],
        password: json['password'],

        avatar: json['avatar'],
        identification: json['identification'],
        address: json['address'],

        dateOfBirth: PDateTimeUtils.parseDateTime(json['dateOfBirth']),

        genderCode: json['genderCode'],
        genderName: json['genderName'],

        medias: (json['medias'] as List<dynamic>)
            .map((media) => Media.fromJson(media),).toList()
    );
  }
}

class Media {
  const Media({this.url});

  final String? url;

  Map<String, dynamic> toJson() => {
    "url": url
  };

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(url: json['url']);
  }
}