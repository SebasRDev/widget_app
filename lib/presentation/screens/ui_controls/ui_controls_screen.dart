import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls Screen'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDev = false;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDev, 
          title: const Text('Developer Mode'),
          subtitle: const Text('Valores Adicionales'),
          onChanged: (value) {
            setState(() { 
              isDev = !isDev;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Medio de transporte'),
          subtitle: Text(selectedTransportation.toString()),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Viajar en Carro'),
              value: Transportation.car, 
              groupValue: selectedTransportation, 
              onChanged: (value){setState(() {
                selectedTransportation = Transportation.car;
              });}
            ),
            RadioListTile(
              title: const Text('Plane'),
              subtitle: const Text('Viajar en Avion'),
              value: Transportation.plane, 
              groupValue: selectedTransportation, 
              onChanged: (value){setState(() {
                selectedTransportation = Transportation.plane;
              });}
            ),
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('Viajar en Bote'),
              value: Transportation.boat, 
              groupValue: selectedTransportation, 
              onChanged: (value){setState(() {
                selectedTransportation = Transportation.boat;
              });}
            ),
            RadioListTile(
              title: const Text('Submarine'),
              subtitle: const Text('Viajar en Submarino'),
              value: Transportation.submarine, 
              groupValue: selectedTransportation, 
              onChanged: (value){setState(() {
                selectedTransportation = Transportation.submarine;
              });}
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Breakfast'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        )
      ],
    );
  }
}