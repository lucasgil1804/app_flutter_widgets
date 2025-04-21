import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: Text('Hola mundo!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('¿Estás seguro?'),
        content: Text(
            'Lorem velit duis proident cillum pariatur cillum id est ea Lorem ea velit pariatur esse. Id consectetur eu laborum et tempor. Ipsum pariatur nisi labore ipsum fugiat nulla occaecat nostrud cillum irure occaecat quis. Qui dolore ullamco occaecat velit cillum reprehenderit in ex amet quis eiusmod adipisicing dolore. Aliquip adipisicing anim exercitation commodo sit velit veniam culpa enim. Anim do magna eiusmod exercitation et cupidatat sint.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  Text(
                      'Excepteur cillum enim amet pariatur dolor ullamco exercitation deserunt aliquip id minim quis. Non dolor elit duis non aliqua exercitation veniam. Excepteur esse minim ullamco labore. Consectetur adipisicing labore exercitation nulla.')
                ]);
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: Text('Mostrar diálogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: Text('Mostrar snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
