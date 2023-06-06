import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI controls'),
      ),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Vehicle { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Vehicle selectedVehicle = Vehicle.car;
  bool wantsBreakfast = false;
  bool wantsLaunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Additional controls'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = value;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehicle'),
          subtitle: Text('$selectedVehicle'),
          children: [
            RadioListTile(
              title: const Text('By car'),
              value: Vehicle.car,
              groupValue: selectedVehicle,
              onChanged: (value) => setState(() {
                selectedVehicle = value!;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              value: Vehicle.boat,
              groupValue: selectedVehicle,
              onChanged: (value) => setState(() {
                selectedVehicle = value!;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              value: Vehicle.plane,
              groupValue: selectedVehicle,
              onChanged: (value) => setState(() {
                selectedVehicle = value!;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              value: Vehicle.submarine,
              groupValue: selectedVehicle,
              onChanged: (value) => setState(() {
                selectedVehicle = value!;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Breakfast?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = value!;
          }),
        ),
        CheckboxListTile(
          title: const Text('Launch?'),
          value: wantsLaunch,
          onChanged: (value) => setState(() {
            wantsLaunch = value!;
          }),
        ),
        CheckboxListTile(
          title: const Text('Dinner?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = value!;
          }),
        ),
      ],
    );
  }
}
