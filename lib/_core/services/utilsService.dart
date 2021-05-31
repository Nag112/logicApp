import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:logic/_core/app/app.locator.dart';

enum SnackbarType { greenAndRed, redAndWhite }
enum DialogType { basic, form }

class UtilsService {
  final SnackbarService _snackBar = locator<SnackbarService>();

  final DialogService _dialogService = locator<DialogService>();
  UtilsService() {
    _setupSnackbarUi();
    _setupDialogUi();
  }
  showErrorSnackBar({title, msg}) {
    _snackBar.showCustomSnackBar(
      variant: SnackbarType.redAndWhite,
      message: msg,
      title: title,
      duration: Duration(seconds: 5),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => {},
    );
  }

  showSnackBar({title, msg}) {
    _snackBar.showSnackbar(
      message: msg,
      title: title,
      duration: Duration(seconds: 5),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => {},
    );
  }

  showToast(text, {background = Colors.red, textColor = Colors.white}) {
    return BotToast.showText(text: text ?? "Toast Message missing");
  }

  Future<DialogResponse?> showDialog({title, description, image = ""}) {
    return _dialogService.showCustomDialog(
        variant: DialogType.basic,
        hasImage: image != "",
        imageUrl: image,
        mainButtonTitle: "OK",
        secondaryButtonTitle: "Cancel",
        title: title,
        description: description);
  }

  void _setupDialogUi() {
    final builders = {
      DialogType.basic: (context, sheetRequest, completer) =>
          _BasicDialog(request: sheetRequest, completer: completer),
      DialogType.form: (context, sheetRequest, completer) =>
          _FormDialog(request: sheetRequest, completer: completer),
    };

    _dialogService.registerCustomDialogBuilders(builders);
  }

  void _setupSnackbarUi() {
    // Registers a config to be used when calling showSnackbar
    _snackBar.registerSnackbarConfig(
      SnackbarConfig(
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        borderRadius: 0,
        margin: EdgeInsets.zero,
      ),
    );
    _snackBar.registerCustomSnackbarConfig(
      variant: SnackbarType.greenAndRed,
      config: SnackbarConfig(
        backgroundColor: Colors.white,
        titleColor: Colors.green,
        messageColor: Colors.red,
        borderRadius: 1,
      ),
    );
    _snackBar.registerCustomSnackbarConfig(
      variant: SnackbarType.redAndWhite,
      config: SnackbarConfig(
        backgroundColor: Colors.red,
        titleColor: Colors.white,
        messageColor: Colors.white,
        borderRadius: 1,
      ),
    );
  }
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
        child: Container(
      height: request.hasImage! ? size.height * 0.4 : 250,
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            request.hasImage!
                ? Image.asset(
                    request.imageUrl!,
                    height: 80,
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            Text(
              request.title!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Text(request.description!),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text(
                      request.secondaryButtonTitle!,
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white)),
                    onPressed: () {
                      completer(
                        DialogResponse(confirmed: false),
                      );
                    }),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    child: Text(
                      request.mainButtonTitle!,
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white)),
                    onPressed: () {
                      completer(
                        DialogResponse(confirmed: true),
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class _FormDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _FormDialog({required this.request,required this.completer});

  @override
  Widget build(BuildContext context) {
    return Dialog(child: Container());
  }
}
