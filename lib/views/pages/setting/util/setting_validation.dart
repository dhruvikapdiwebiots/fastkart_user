
import 'package:fastkart_user/views/pages/login/util/login_constants.dart';
import 'package:fastkart_user/views/pages/setting/util/setting_constants.dart';

class SettingValidation {
  //validate for email
  bool isEmail(String str) {
    RegExp email = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    return email.hasMatch(str.toLowerCase());
  }

//validate for password
  bool isPassword(String str) {
    RegExp pwd = RegExp(r"^(?:(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*)$");
    return pwd.hasMatch(str);
  }

// Check Id Validation
  String? checkIDValidation(value) {
    if (value.isEmpty) {
      return LoginFont().userFieldError;
    } else if (SettingValidation().isEmail(value) == false) {
      return LoginFont().inCorrectUsername;
    } else {
      return null;
    }
  }


// Check Phone Validation
  String? checkPhoneValidation(value) {
    if (value.isEmpty) {
      return SettingFont().phoneFieldError;
    } else if (value.length < 10) {
      return SettingFont().phoneValidation;
    } else {
      return null;
    }
  }

// Check Password Validation
  String? checkPasswordValidation(value) {
    if (value.isEmpty) {
      return LoginFont().passwordFieldError;
    }else if (value.length <= 7){
      return LoginFont().passwordMininumValueEnter;
    }else{
      return null;
    }
  }

  // Check username Validation
  String? checkUserNameValidation(value) {
    if (value.isEmpty) {
      return SettingFont().fullNameRequired;
    } else {
      return null;
    }
  }
}
