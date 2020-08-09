class Validator {
  static String validateEmail(String value) {
    if (value.isEmpty) return "Email cannot be empty";
    if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value)) return "Email field is not valid";
    return null;
  }

  static String validatePassword(String value) {
    return value.isNotEmpty ? null : "Password field cannot be empty";
  }

  static String validatePhoneNumber(String value){
    String status = validateEmpty(value);
    if(status != null) return status;
    int number = int.tryParse(value);
    if(number == null) return "Enter valid phone number";
    return  value.length == 10 ? null : "Mobile number must be 10 digit" ;
  }

  static String validateConfirmPassword(String value, String password) {
    return value == password ? null : "This does not match with password";
  }

  static String validateEmpty(String value) {
    return value.isNotEmpty ? null : 'The field cannot be empty';
  }
}
