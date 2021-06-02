import 'package:flutter/material.dart';
import 'package:logic/constants.dart';
import 'package:logic/views/_components/roundedInput.dart';
import 'package:stacked/stacked.dart';
import 'calcyScreenViewModel.dart';

enum ValidationType { TEXT, NO_CHAR, CUSTOM }

class CalcyScreen extends StatelessWidget {
  CalcyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalcyScreenViewModel>.reactive(
      viewModelBuilder: () => CalcyScreenViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text("Logic"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.history),
              onPressed: viewModel.openHistory,
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: ListView(
            shrinkWrap: true,
            children: [
              RoundedInputField(
                hintText: "one",
                onChanged: (val) => viewModel.onText('one', val),
              ),
              RoundedInputField(
                hintText: "two",
                onChanged: (val) => viewModel.onText('two', val),
              ),
              RoundedInputField(
                hintText: "three",
                onChanged: (val) => viewModel.onText('three', val),
              ),
              RoundedInputField(
                hintText: "four",
                onChanged: (val) => viewModel.onText('four', val),
              ),
              RoundedInputField(
                hintText: "five",
                onChanged: (val) => viewModel.onText('five', val),
              ),
              RoundedInputField(
                hintText: "six",
                onChanged: (val) => viewModel.onText('six', val),
              ),
              RoundedInputField(
                hintText: "seven",
                onChanged: (val) => viewModel.onText('seven', val),
              ),
              RoundedInputField(
                hintText: "eight",
                onChanged: (val) => viewModel.onText('eight', val),
              ),
              RoundedInputField(
                hintText: "nine",
                onChanged: (val) => viewModel.onText('nine', val),
              ),
              RoundedInputField(
                hintText: "ten",
                onChanged: (val) => viewModel.onText('ten', val),
              ),
              RoundedInputField(
                hintText: "eleven",
                onChanged: (val) => viewModel.onText('eleven', val),
              ),
              RoundedInputField(
                hintText: "twelve",
                onChanged: (val) => viewModel.onText('twelve', val),
              ),
              RoundedInputField(
                hintText: "thirteen",
                onChanged: (val) => viewModel.onText('thirteen', val),
              ),
              RoundedInputField(
                hintText: "14",
                onChanged: (val) => viewModel.onText('14', val),
              ),
              RoundedInputField(
                hintText: "15",
                onChanged: (val) => viewModel.onText('15', val),
              ),
              RoundedInputField(
                hintText: "16",
                onChanged: (val) => viewModel.onText('16', val),
              ),
              RoundedInputField(
                hintText: "17",
                onChanged: (val) => viewModel.onText('17', val),
              ),
              RoundedInputField(
                hintText: "18",
                onChanged: (val) => viewModel.onText('18', val),
              ),
              RoundedInputField(
                hintText: "19",
                onChanged: (val) => viewModel.onText('19', val),
              ),
              RoundedInputField(
                hintText: "20",
                onChanged: (val) => viewModel.onText('20', val),
              ),
              SizedBox(
                height: 20,
              ),
              if (viewModel.showResult)
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Result : ",
                        style: TextStyle(color: kPrimaryColor, fontSize: 18),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        viewModel.result.toString(),
                        style: TextStyle(color: kPrimaryColor, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(text: "Calculate", onPress: viewModel.calculate)
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;

  final bool? readOnly;
  final String? Function(String?)? validator;
  final ValidationType validationType;
  final String? value;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.readOnly = false,
    this.value,
    this.validator,
    this.validationType = ValidationType.TEXT,
  }) : super(key: key);

  validation(val) {
    switch (validationType) {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              hintText,
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            ),
          ),
          Container(
            child: TextFormField(
              onChanged: onChanged,
              keyboardType: TextInputType.number,
              initialValue: value != null ? value : '',
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                filled: true,
                fillColor: kPrimaryLightColor,
                focusColor: kPrimaryLightColor,
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(29),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
