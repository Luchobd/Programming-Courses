import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/widgets/drawers/side_menu.dart';
// import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

// Pantalla principal de la aplicación. Creación y utilización de ListView.builder y ListTile.
class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems
          .length, // cantidad de items. "Importante para la visualización de la lista"
      itemBuilder: (context, index) {
        final menuItem =
            appMenuItems[index]; // Accedemos al item en la posición index
        // ListTile es un widget que permite mostrar una lista de items
        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title), // Título del item
      subtitle: Text(menuItem.subTitle), // Subtítulo del item
      leading: Icon(menuItem.icon, color: colors.primary), // Icono del item
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ), // Flecha de navegación
      onTap: () {
        // Acción que se ejecuta al presionar el item
        // ! Navegar a otra pantalla... "No recomendado para apps grandes !!!"
        // Navigator.of(context).push(
        //   MaterialPageRoute<void>(builder: (context) => const ButtonsScreen()),
        // );

        // ! Navegar a otra pantalla usando pushNamed. "No recomendado para apps grandes !!!".
        // Navigator.pushNamed(context, menuItem.link);

        // * Navegar a otra pantalla usando push. "Recomendado para apps grandes !!!".
        // push => Añade una nueva ruta a la pila de navegación. Se puede "ir y volver".
        context.push(menuItem.link);

        // * Navegar a otra pantalla usando pushNamed. "Solo aplica para la re-dirección de una pantalla por nombre".
        // context.pushNamed(menuItem.link);
      },
    );
  }
}
