import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    // PageView es un widget que permite hacer scroll vertical...
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(), // Habilitar acción para Android...
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // Video Player + gradiente

            // Botones laterales
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
      // children: [
      //   Container(color: Colors.red),
      //   Container(color: Colors.blue),
      //   Container(color: Colors.green),
      //   Container(color: Colors.yellow),
      //   Container(color: Colors.purple),
      // ],
    );
  }
}
