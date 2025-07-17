import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

class PObjectUtils {
  static bool isNull(Object? input) {
    return input == null;
  }

  static bool isNotNull(Object? input) {
    return input != null;
  }

  static bool isEquals(Object? input1, Object? input2) {
    if(input1 != null && input2 != null) {
      return input1 == input2;
    } else {
      return false;
    }
  }

  static T requiredNonNullOrElse<T>(T? input1, T input2) {
    return input1 ?? input2;
  }
}

class PStringUtils {
  static bool isEmpty(String? input) {
    return input == null || input == "";
  }

  static bool isNotEmpty(String? input) {
    return input != null && input != "";
  }

  static bool isMatch(String? input, RegExp regex) {
    if (isEmpty(input)) {
      return false;
    }

    return regex.hasMatch(input!);
  }
}

class PResponseStatusUtils {
  static bool isSuccess(ValueResponse? response) {
    if (response == null) {
      return false;
    }

    return response.success!;
  }
}

class PWidgetUtils {
  static Widget chooseWithCondition(bool condition, Widget first, Widget two) {
    return condition ? first : two;
  }
}

class PDateTimeUtils {
  static String parseString(DateTime? dateTime) {
    return dateTime != null ? dateTime.toIso8601String() : "";
  }

  static DateTime formatDateTime(String dateTime, String format) {
    DateFormat dateFormat = DateFormat(format);
    return dateFormat.parse(dateTime);
  }

  static DateTime parseDateTime(String dateTime) {
    return DateTime.parse(dateTime);
  }
}