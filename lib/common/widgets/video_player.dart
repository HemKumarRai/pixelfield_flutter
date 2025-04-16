import 'package:flutter/material.dart';
import 'package:pixelfield/common/builder/if_builder.dart';
import 'package:pixelfield/common/builder/if_else_builder.dart';
import 'package:pixelfield/utils/colors/colors.dart';
import 'package:pixelfield/utils/images/images_utils.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool isTappedInScreen = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Future<void> changeStatus() async {
    setState(() {
      isTappedInScreen = !isTappedInScreen;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isTappedInScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await changeStatus();
      },
      child: Center(
        child: _controller.value.isInitialized
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 233,
                    width: double.infinity,
                    color: ColorUtils.darkBackgroundColor,
                    child: VideoPlayer(_controller),
                  ),
                  IfBuilder(
                      condition: isTappedInScreen,
                      builder: (context) {
                        return IfElseBuilder(
                            condition: _controller.value.isPlaying,
                            ifBuilder: (context) => IconButton(
                                onPressed: () async {
                                  await _controller.pause();
                                  await changeStatus();
                                },
                                icon: const Icon(Icons.pause)),
                            elseBuilder: (context) {
                              return InkWell(
                                  onTap: () async {
                                    await _controller.play();
                                    await changeStatus();
                                  },
                                  child: Image.asset(ImagesUtils.play));
                            });
                      })
                ],
              )
            : Container(
                height: 233,
                width: double.infinity,
                color: ColorUtils.darkBackgroundColor,
              ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
