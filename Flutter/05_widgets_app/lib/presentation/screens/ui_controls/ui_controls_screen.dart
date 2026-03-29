import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UiControlsView(),
    );
  }
}

// 1. Primera clase: El StatefulWidget
class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  // Aquí devolvemos la clase State (la que está justo abajo)
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

// 2. Segunda clase: El State (¡Debe ir fuera de la primera clase!)
class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // SwitchListTile. Es un widget que combina un Switch con un ListTile.
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value:
              isDeveloper, // Nota: Al estar en "true", el switch estará estático
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        // Este es el nuevo widget envoltorio. Para agrupar los RadioListTile.
        RadioGroup<Transportation>(
          // 1. El estado y el evento se declaran UNA SOLA VEZ aquí arriba
          groupValue: selectedTransportation,
          onChanged: (value) {
            setState(() {
              selectedTransportation = value!;
            });
          },
          // 2. Agrupas tus opciones en una columna (o cualquier otro layout)
          child: ExpansionTile(
            title: const Text('Vehículo de transporte'),
            subtitle: Text('$selectedTransportation'),
            children: [
              RadioListTile<Transportation>(
                title: const Text('By Car'),
                subtitle: const Text('Viajar en carro'),
                value: Transportation.car,
                // Ya no necesitas groupValue ni onChanged aquí
              ),
              RadioListTile<Transportation>(
                title: const Text('By Boat'),
                subtitle: const Text('Viajar en barco'),
                value: Transportation.boat,
              ),
              RadioListTile<Transportation>(
                title: const Text('By Plane'),
                subtitle: const Text('Viajar en avión'),
                value: Transportation.plane,
              ),
              RadioListTile<Transportation>(
                title: const Text('By Submarine'),
                subtitle: const Text('Viajar en submarino'),
                value: Transportation.submarine,
              ),
            ],
          ),
        ),

        // CheckboxListTile. Es un widget que combina un Checkbox con un ListTile.
        CheckboxListTile(
          title: const Text('¿Desea desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),

        CheckboxListTile(
          title: const Text('¿Desea almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),

        CheckboxListTile(
          title: const Text('¿Desea Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
