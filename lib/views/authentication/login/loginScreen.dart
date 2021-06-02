import 'package:flutter/material.dart';
import 'package:logic/views/_components/roundedInput.dart';
import 'package:stacked/stacked.dart';
import 'loginViewModel.dart';

class LoginScreen extends StatelessWidget {
    BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20.0),
            margin: EdgeInsets.only(top: size.width * 0.40),
            child: Form(
              key: model.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Logic",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.pink,
                        fontSize: size.width * 0.15,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    RoundedInputField(
                      hintText: "Your phone",
                      icon: Icons.person,
                      validationType: ValidationType.PHONE,
                      keyboardType: TextInputType.number,
                      onChanged: model.onPhone,
                    ),
                    SizedBox(height: 05),
                    RoundedButton(text: "SIGN IN", onPress: model.onSubmit),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
