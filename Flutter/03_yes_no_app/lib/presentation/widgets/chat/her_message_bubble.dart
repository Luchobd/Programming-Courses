import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // Obtiene el color scheme del tema actual...
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // Color secundario del tema actual.
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white)),
          ),
        ),

        const SizedBox(height: 5),
        // _ImageBubble(
        //   message.imageUrl ??
        //       'https://media4.giphy.com/media/v1.Y2lkPWFmMzk1ZjIwN3I0MThrNzdvMDBjMjlxOGlyeW85cngwem91Zjk5ZmZsMmdoeTZhbCZlcD12MV9naWZzX3JhbmRvbSZjdD1n/ur8pcK1C73Lqw/giphy.gif',
        // ),
        _ImageBubble(
          message.imageUrl!),
        SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla. Dimensiones del dispositivo.
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('Cargando...'),
          );
        },
      ),
    );
  }
}
