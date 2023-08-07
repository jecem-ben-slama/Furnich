/*import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late VideoPlayerController controller;
  bool isPlaying = false;

  @override
  void initState() {
    controller = VideoPlayerController.asset('assets/video/vid.mp4');

    controller.initialize().then((_) {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    setState(() {
      isPlaying = controller.value.isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: controller.value.isInitialized
            ? Stack(
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: controller.value.size.width,
                          height: controller.value.size.height,
                          child: VideoPlayer(controller),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: _togglePlayPause,
                      child: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                color: Colors.red,
              ),
      ),
    );
  }
}
*/