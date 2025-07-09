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