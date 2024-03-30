import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navigationDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    void onNavigationDrawerItemTapped(int index) {
      setState(() {
        navigationDrawerIndex = index;
      });
      context.pushNamed(
        appMenuItems.elementAt(navigationDrawerIndex).route
      );
    }

    return NavigationDrawer(
      selectedIndex: navigationDrawerIndex,
      onDestinationSelected: onNavigationDrawerItemTapped,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, hasNotch ? 0 : 20, 16, 0),
          child: const DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Flutter + Material 3'),
                SizedBox(height: 10),
                Text('Widgets App'),
              ],
            ),
          ),
        ),
        ...appMenuItems
          .sublist(0, 3)
          .map((MenuItem item, ) => NavigationDrawerDestination(
            label: Text(item.title),
            icon: Icon(item.icon),
          )),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('More Options'),
              Divider(),
            ],
          )
        ),
        ...appMenuItems
          .sublist(3, appMenuItems.length)
          .map((MenuItem item, ) => NavigationDrawerDestination(
            label: Text(item.title),
            icon: Icon(item.icon),
          )),

    ]);
  }
}