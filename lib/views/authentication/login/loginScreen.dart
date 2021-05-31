import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'loginViewModel.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, _) {
        return Scaffold();
      },
    );
  }
}
