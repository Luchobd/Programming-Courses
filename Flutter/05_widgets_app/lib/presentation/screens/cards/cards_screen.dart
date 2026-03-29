import 'package:flutter/material.dart';

// Lista de tarjetas.
const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

// Pantalla de las tarjetas.
class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Screen')),
      body: _CardsView(),
    );
  }
}

// Vista de las tarjetas.
class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView permite que el contenido se desplace.
    // Si no se usa, el contenido no se podrá ver si excede el tamaño de la pantalla.
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) =>
                _CardType1(elevation: card['elevation'], label: card['label']),
          ),

          ...cards.map(
            (card) =>
                _CardType2(elevation: card['elevation'], label: card['label']),
          ),

          ...cards.map(
            (card) =>
                _CardType3(elevation: card['elevation'], label: card['label']),
          ),

          ...cards.map(
            (card) =>
                _CardType4(elevation: card['elevation'], label: card['label']),
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }
}

// Card con elevación.
class _CardType1 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType1({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(alignment: Alignment.bottomLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType2({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: colors.outline),
      ),
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType3({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors
          .surfaceContainerHighest, // Color de la tarjeta. Background más claro.
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType4({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior:
          Clip.antiAlias, // Recorta la imagen para que no se salga del card.
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.topRight,
            // Se usa un container para que el icono tenga un fondo y se vea mejor.
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
