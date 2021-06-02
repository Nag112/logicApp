import 'package:flutter/material.dart';
import 'package:logic/constants.dart';
import 'package:logic/views/_components/roundedInput.dart';
import 'package:stacked/stacked.dart';

import 'profileViewModel.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Center(
            child: Container(
              height: 60,
              width: 150,
              child: RoundedButton(
                onPress: model.logout,
                color: kPrimaryColor,
                text: "Logout",
              ),
            ),
          ),
        );
      },
    );
  }
}
