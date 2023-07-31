import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ){

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog( BuildContext context ){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Nulla nulla nostrud sunt nulla. Sit cupidatat velit non ad occaecat non nulla non consectetur ex anim ea. Nulla elit deserunt adipisicing fugiat tempor sunt cillum adipisicing laboris deserunt esse est deserunt consectetur. Ex duis commodo sit occaecat nulla laboris ex. Consectetur fugiat ea esse in. Lorem eiusmod deserunt occaecat id sunt. Quis veniam anim aute eiusmod esse deserunt sunt eu do sit reprehenderit do.'),
        actions: [
          TextButton(onPressed: ()=>context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: ()=>context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars adn Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Hola mundo esta es una prueba de texto en el dialog de las licencias')
                  ]
                );
              }, 
              child: const Text('Licenses')
            ),
            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
              child: const Text('Show Dialog')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'), 
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}