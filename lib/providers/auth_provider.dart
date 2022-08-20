import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> signUpKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();

  String? NameValidation(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return "Name is required";
    } else if (!regExp.hasMatch(value ?? '')) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  emailValidation(String value) {
    if (!isEmail(value)) {
      return "Invalid email format";
    }
  }

  offerValidation(String value) {
    if (!isEmail(value)) {
      return "Invalid email format";
    }
  }

  categoryValidation(String value) {
    if (!isEmail(value)) {
      return "Invalid email format";
    }
  }

  String? passwordValidation(String? value) {
    if ((value?.length ?? 0) < 6) {
      return 'Password must be more than 5 characters';
    } else {
      return null;
    }
  }

  String? mobileValidation(String? value) {
    String pattern = r'(^\+?[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return "Mobile phone number is required";
    } else if (!regExp.hasMatch(value ?? '')) {
      return "Mobile phone number must contain only digits";
    }
    return null;
  }

}
