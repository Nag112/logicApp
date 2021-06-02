import 'package:flutter/material.dart';
import 'package:logic/constants.dart';

enum ValidationType { EMAIL, PHONE, TEXT, NO_CHAR, CUSTOM }

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final ValidationType validationType;
  final String? value;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.value,
    this.validator,
    this.validationType = ValidationType.TEXT,
  }) : super(key: key);

  validation(val) {
    switch (validationType) {
      case ValidationType.EMAIL:
        if (val == null || val == "") return "email address is required";
        if (isValidEmail(val)) {
          return null;
        } else
          return "Invalid Email address";

      case ValidationType.PHONE:
        if (val == null || val == "") return "required field";
        if (isValidPhone(val)) {
          return null;
        } else
          return "Invalid phone number";

      case ValidationType.TEXT:
        if (val == null || val == "")
          return "required field";
        else
          return null;

      case ValidationType.NO_CHAR:
        if (val == null || val == "") return "required field";
        if (val.toString().contains(' ')) {
          return "cannot contain special characters";
        } else
          return null;

      case ValidationType.CUSTOM:
        return validator!(val);

      default:
        return null;
    }
  }

  isValidPhone(phone) {
    if (phone != null && phone.length == 10) {
      return int.tryParse(phone) != null ? true : false;
    } else
      return false;
  }

  isValidEmail(email) {
    if (email != null && email.length > 0) {
      RegExp regex = new RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      return regex.hasMatch(email);
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: TextFormField(
        keyboardType: keyboardType,
        initialValue: value,
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        validator: validator ?? (val) => validation(val),
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: kPrimaryLightColor,
          focusColor: kPrimaryLightColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          prefixIcon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(29),
          ),
        ),
      ),
    );
  }
}

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? Function(String?)? validator;

  const RoundedPasswordField({
    Key? key,
    this.onChanged,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: hidePassword,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        validator: widget.validator ??
            (val) {
              if (val?.replaceAll(" ", "") == "") {
                return "required field";
              } else
                return null;
            },
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(
              hidePassword ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
            onPressed: () => {
              setState(() {
                hidePassword = !hidePassword;
              })
            },
          ),
          filled: true,
          fillColor: kPrimaryLightColor,
          focusColor: kPrimaryLightColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          prefixIcon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(29),
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? onPress;
  final Color? color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      splashColor: Colors.blueAccent,
      onTap: onPress,
    );
  }
}
