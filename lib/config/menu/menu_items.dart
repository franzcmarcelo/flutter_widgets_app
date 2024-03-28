import 'package:flutter/material.dart' show IconData, Icons;
import 'package:flutter_widgets_app/presentations/screens/screens.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final IconData icon;
  final String route;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.route,
  });
}

const List<MenuItem> appMenuItems = [
  MenuItem(
    title: 'Buttons',
    subTitle: 'Different types of buttons',
    route: ButtonsScreen.name,
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'A container styled',
    route: CardsScreen.name,
    icon: Icons.credit_card,
  ),
];