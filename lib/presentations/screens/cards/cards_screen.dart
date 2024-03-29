import 'package:flutter/material.dart';

const List<Map<String, dynamic>> cards = [
  { 'elevation': 0.0, 'label': 'Elevation 0.0' },
  { 'elevation': 1.0, 'label': 'Elevation 1.0' },
  { 'elevation': 2.0, 'label': 'Elevation 2.0' },
  { 'elevation': 3.0, 'label': 'Elevation 3.0' },
  { 'elevation': 4.0, 'label': 'Elevation 4.0' },
  { 'elevation': 5.0, 'label': 'Elevation 5.0' },
  { 'elevation': 6.0, 'label': 'Elevation 6.0' },
  { 'elevation': 7.0, 'label': 'Elevation 7.0' },
  { 'elevation': 8.0, 'label': 'Elevation 8.0' },
  { 'elevation': 9.0, 'label': 'Elevation 9.0' },
  { 'elevation': 10.0, 'label': 'Elevation 10.0'},
];

class CardsScreen extends StatelessWidget {

  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView()
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardType1(
            elevation: card['elevation'],
            label: card['label'],
          )),
          ...cards.map((card) => _CardType2(
            elevation: card['elevation'],
            label: card['label'],
          )),
          ...cards.map((card) => _CardType3(
            elevation: card['elevation'],
            label: card['label'],
          )),
          ...cards.map((card) => _CardType4(
            elevation: card['elevation'],
            label: card['label'],
          )),
          const SizedBox(height: 20),
        ]
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType1({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        )
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType2({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colors.primary,
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Outline'),
            )
          ],
        )
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType3({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surface,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )
          ],
        )
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType4({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/350',
            height: 350,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
                ),
              );
            },
            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Center(
                child: Text('Error loading image'),
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}