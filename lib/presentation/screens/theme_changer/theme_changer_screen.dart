import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar tema app'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(icon:  Icon(isDarkMode == true ?Icons.light_mode_outlined : Icons.dark_mode_outlined), onPressed: () {
              // ref.read(isDarkModeProvider.notifier).state = !ref.read(isDarkModeProvider.notifier).state;
              ref.read(themeNotifierProvider.notifier).toogleDarkMode();
            },),
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListprovider);
    // final int selectedIndexColor = ref.watch(selectedIndexColorProvider);
    final selectedIndexColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text(
            'Color',
            style: TextStyle(
              color: color
            ),
            ),
          subtitle: Text('${color.toARGB32()}'),
          value: index, 
          groupValue: selectedIndexColor, 
          activeColor: color,
          onChanged: (value) {
            // ref.read(selectedIndexColorProvider.notifier).state = value!;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(value!);
          }
        );
      },
    );
  }
}