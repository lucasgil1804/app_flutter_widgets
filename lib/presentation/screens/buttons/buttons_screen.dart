import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated')),
            ElevatedButton(onPressed: null, child: Text('Disabled Elevated')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_rounded),
                label: Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: Icon(Icons.ac_unit_rounded),
                label: Text('Filled Icon')),
            OutlinedButton(onPressed: () {}, child: Text('Outlined')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_time_filled_rounded),
                label: Text('Outlined Icon')),
            TextButton(onPressed: () {}, child: Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.account_balance_rounded),
                label: Text('Text Icon')),

            // TODO: Custom button
            IconButton(
                onPressed: () {}, icon: Icon(Icons.account_tree_rounded)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.adb_rounded),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: WidgetStatePropertyAll(Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
