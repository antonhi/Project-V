import 'package:flutter/material.dart';
import 'package:projectv/utility/colors.dart';
import 'package:projectv/widgets/text/bolded_standard_text.dart';
import 'package:video_player/video_player.dart';

import '../../models/post.dart';

class PostVideo extends StatefulWidget {

  final Post post;
  final double width;
  final bool isInView;

  const PostVideo({Key? key, required this.post, required this.width, required this.isInView}) : super(key: key);

  @override
  State<PostVideo> createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {
  
  late VideoPlayerController controller;
  bool isPlaying = false;
  bool pause = false;
  double position = 0;
  
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('videos/example.mp4');
    controller.initialize().then((value) {
      setState(() {});
      controller.setLooping(true);
      controller.addListener(updatePosition);
      if (widget.isInView) {
        startVideo();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    playback();
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: controller.value.isInitialized ?
        Stack(children: [
          Positioned(child: AspectRatio(aspectRatio: controller.value.aspectRatio, child: GestureDetector(child: VideoPlayer(controller), onTap: () {
            setState(() {
              pause = !pause;
            });
          },))),
          Positioned(child: AnimatedSwitcher(duration: const Duration(seconds: 1),
          child: isPlaying ? const SizedBox(height: 0,) : GestureDetector(child: Container(width: widget.width, height: widget.width/(1920/1080), decoration: BoxDecoration(color: AppColors.backgroundColor.withOpacity(0.4)),),
          onTap: () {
            setState(() {
              pause = !pause;
            });
          }))),
          Positioned(left: 10, top: 10, child: AnimatedSwitcher(duration: const Duration(milliseconds: 500), child: isPlaying ? const SizedBox(height: 0,) : BoldedStandardText(text: widget.post.title ?? '', color: Colors.white,),)),
          Positioned(left: 10, right: 10, bottom: 10,child: Slider(value: position, onChanged: (_) {}, min: 0, max: (controller.value.isInitialized ? controller.value.duration.inSeconds*1.0 : 0),))
        ],) :
        Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void playback() {
    if (widget.isInView && controller.value.isInitialized && !pause) {
      startVideo();
    } else {
      pauseVideo();
    }
  }

  void startVideo() {
    setState(() {
      isPlaying = true;
    });
    controller.play();
  }

  void pauseVideo() {
    controller.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void updatePosition() async {
    var position = await controller.position;
    setState(() {
      this.position = position == null ? 0 : position.inSeconds.toDouble();
    });
  }

}
