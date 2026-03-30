import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quod.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quod.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quod.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached =
      false; // Bandera para detectar si llegamos al final del tutorial.

  @override
  void initState() {
    super.initState();

    // Este listener se encarga de detectar el scroll de la pantalla.
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      } else if (endReached && page < (slides.length - 1.5)) {
        setState(() {
          endReached = false;
        });
      }
      // print('Page: ${pageViewController.page}');
    });
  }

  // Es importante liberar los recursos cuando el widget se elimina de la pantalla.
  @override
  void dispose() {
    // Se ejecuta cuando el widget se elimina de la pantalla.
    pageViewController.dispose();
    super.dispose();
  }

  // Este widget es el que se encarga de mostrar el tutorial.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            // Este es el que controla el scroll de la pantalla.
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideDate) => _Slide(
                    title: slideDate.title,
                    caption: slideDate.caption,
                    imageUrl: slideDate.imageUrl,
                  ),
                )
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),

          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: Duration(milliseconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: Text('Comenzar'),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Extrae los estilos de texto del tema actual.
    final TextTheme(:titleLarge, :bodyMedium) = Theme.of(context).textTheme;

    // Retorna un widget Padding que contiene un widget Center.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos verticalmente.
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinea los elementos a los laterales.
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 20),
            Text(title, style: titleLarge),
            SizedBox(height: 10),
            Text(caption, style: bodyMedium),
          ],
        ),
      ),
    );
  }
}
