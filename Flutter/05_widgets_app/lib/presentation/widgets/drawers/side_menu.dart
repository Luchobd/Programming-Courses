import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    Key? key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

// State del SideMenu. Es necesario para manejar el estado del NavigationDrawer.
class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch =
        MediaQuery.of(context).viewPadding.top >
        35; // Detecta si el dispositivo tiene notch.
    if (Platform.isIOS) {
      print('IOS $hasNotch');
    }

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {


        setState(() {
          navDrawerIndex = value; // Actualiza el índice del item seleccionado.
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        // Forma correcta de poder llamar a un método del padre desde el hijo, dentro de un stateful widget.
        widget.scaffoldKey.currentState?.closeDrawer(); 
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: Text('Main'),
        ),

        // Esto es para mostrar todos los items del menú.
        ...appMenuItems
            .sublist(
              0,
              3,
            ) // Esto es para mostrar solo los primeros 3 items del menú.
            .map(
              // Esto es para mapear los items del menú.
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),
        Padding(padding: EdgeInsets.fromLTRB(28, 10, 16, 10), child: Text('More Options')),

        ...appMenuItems
            .sublist(
              3,
              6,
            ) // Esto es para mostrar solo los primeros 3 items del menú.
            .map(
              // Esto es para mapear los items del menú.
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),
        Padding(padding: EdgeInsets.fromLTRB(28, 10, 16, 10), child: Text('More Options')),

        ...appMenuItems
            .sublist(
              6,
            ) // Esto es para mostrar solo los primeros 3 items del menú.
            .map(
              // Esto es para mapear los items del menú.
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
