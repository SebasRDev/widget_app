import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


class ChangeColorScreen extends ConsumerWidget {

  static const String name = "change_color_screen";

  const ChangeColorScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final bool isDarkMode = ref.watch(isDarkmodeProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambia el color de la app'),
        actions: [
          IconButton(
            icon: Icon( isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined ),
            onPressed: (){
              ref.read(isDarkmodeProvider.notifier).update((isDarkMode) => !isDarkMode);
            }, 
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch( colorListProvider );
    final int selectedColor = ref.watch( indexColorProvider );

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {

        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value) {
            ref.read( indexColorProvider.notifier ).update((state) => index);
            //todo: notificar el cambio
          },
        );
      },
    );
  }
}