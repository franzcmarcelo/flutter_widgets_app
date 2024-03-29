import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const String name = 'ui_control_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum _Transportation { car, bike, bus, train }

List<Map<String, dynamic>> _transportationData = [
  { 'title': 'By car', 'subtitle': 'Travel by car', 'value': _Transportation.car },
  { 'title': 'By bike', 'subtitle': 'Travel by bike', 'value': _Transportation.bike },
  { 'title': 'By bus', 'subtitle': 'Travel by bus', 'value': _Transportation.bus },
  { 'title': 'By train', 'subtitle': 'Travel by train', 'value': _Transportation.train }
];

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloperMode = true;
  _Transportation selectedTransportation = _Transportation.car;
  bool wantsCoffee = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Additional controls'),
          value: isDeveloperMode,
          onChanged: (value) {
            setState(() {
              isDeveloperMode = value;
            });
          },
        ),

        ExpansionTile(
          title: const Text('Transportation Mode'),
          subtitle: const Text('Select your transportation mode'),
          children: _transportationData.map((data) {
            return RadioListTile(
              title: Text(data['title']),
              subtitle: Text(data['subtitle']),
              value: data['value'],
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = data['value'];
                });
              },
            );
          }).toList(),
        ),

        CheckboxListTile(
          title: const Text('Coffee'),
          subtitle: const Text('Do you want coffee?'),
          value: wantsCoffee,
          onChanged: (value) {
            setState(() {
              wantsCoffee = !wantsCoffee;
            });
          },
        ),
      ],
    );
  }
}