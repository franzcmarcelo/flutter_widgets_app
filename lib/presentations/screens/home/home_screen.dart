import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_widgets_app/config/menu/menu_items.dart';
import 'package:flutter_widgets_app/presentations/screens/home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      drawer: const SideMenu(),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    Widget menuItemBuilder(BuildContext context, int index) {
      final menuItem = appMenuItems[index];
      return _CustomListTile(menuItem: menuItem);
    }

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: menuItemBuilder,
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // whit go_router
        context.pushNamed(menuItem.route);
        // context.push(menuItem.route);
        // context.go(menuItem.route);

        // native api for navigation
        // Navigator.pushNamed(context, menuItem.route);
      }
    );
  }
}
