class ValidationUtils {
  /*static String validatePhoneNumber(BuildContext context, String _value) {
    const pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    final regExp = RegExp(pattern);
    var errorMsg = '';
    if (_value.isEmpty) {
      errorMsg = AppLocalizations.of(context)
          .translate('validation_phoneNumber_notEmptyMessage');
    } else if (!(_value.startsWith('0') && regExp.hasMatch(_value))) {
      errorMsg = AppLocalizations.of(context)
          .translate('validation_phoneNumber_invalidMessage');
    }
    return errorMsg;
  }*/

  static bool isValidEmail(String email) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(pattern, caseSensitive: false).hasMatch(email);
  }

  static bool isValidPassword(String email) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return RegExp(pattern, caseSensitive: false).hasMatch(email);
  }

  static bool isValidatePhoneNumber(String phoneNumber) {
    const pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    final regExp = RegExp(pattern);
    // if (phoneNumber == null) {
    //   return true;
    // } else
    if (phoneNumber.isEmpty == true) {
      return false;
    } else if (!(phoneNumber.startsWith('0') == true &&
        regExp.hasMatch(phoneNumber))) {
      return false;
    }
    return true;
  }

  static bool isValidateYear(String year) {
    const pattern = r'^\d{4}$';
    final regExp = RegExp(pattern);
    if (year.isNotEmpty == true) {
      if (regExp.hasMatch(year)) {
        var _year = int.tryParse(year);
        return _year! <= DateTime.now().year;
      }
      return false;
    }
    return false;
  }
}
