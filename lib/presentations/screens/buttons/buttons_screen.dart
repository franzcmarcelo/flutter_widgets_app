import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center, // y axis
          alignment: WrapAlignment.center, // x axis
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Button Disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Elevated Button Icon'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled Button'),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessibility_new_sharp),
              label: const Text('Filled Button Icon'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.workspaces_sharp),
              label: const Text('Outlined Button Icon'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.tab_rounded),
              label: const Text('Text Button Icon'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dark_mode),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.light_mode),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
                iconColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),
            const _CustomButton(),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.indigoAccent,
        child: InkWell(
          onTap: () => {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Custom Button',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}