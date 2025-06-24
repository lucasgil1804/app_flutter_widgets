import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(icon:  Icon(isDarkMode == true ?Icons.light_mode_outlined : Icons.dark_mode_outlined), onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !ref.read(isDarkModeProvider.notifier).state;
            },),
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge,)
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
        ref.read(counterProvider.notifier).state++;
      },
      child: Icon(Icons.add),),
    );
  }
}