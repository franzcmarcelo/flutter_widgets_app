import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showSnackBar(context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hello, I am a snackbar!'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars'),
      ),
      body: const _SnackbarView(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.message),
        onPressed: () => showSnackBar(context),
      ),
    );
  }
}

class _SnackbarView extends StatelessWidget {

  const _SnackbarView();

  void openDialog(context) {
    showDialog(
      context: context,
      // * user must tap button!
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Snackbar'),
        content: const Text('This is a simple snackbar example.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.pop(), // * with GoRouter
            // onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              // * showAboutDialog is a widget prebuilt by Flutter to show the licenses of the used packages
              showAboutDialog(
                context: context,
                applicationIcon: const FlutterLogo(),
                applicationVersion: '1.0.0',
                children: const [
                  Text('This is a simple app to demonstrate the usage of Flutter Widgets.'),
                ],
              );
            },
            child: const Text('Used Licenses'),
          ),
          FilledButton.tonal(
            onPressed: () {
              openDialog(context);
            },
            child: const Text('Show Dialog'),
          ),
        ],
      )
    );
  }
}