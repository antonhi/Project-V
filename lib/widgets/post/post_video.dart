import 'package:flutter/material.dart';
import 'package:projectv/utility/colors.dart';
import 'package:projectv/widgets/text/bolded_standard_text.dart';
import 'package:video_player/video_player.dart';

import '../../models/post.dart';

class PostVideo extends StatefulWidget {

  final Post post;
  final double width;

  const PostVideo({Key? key, required this.post, required this.width}) : super(key: key);

  @override
  State<PostVideo> createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {
  
  late VideoPlayerController controller;
  bool started = false;
  bool isPlaying = false;
  
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('videos/example.mp4');
    controller.initialize().then((value) {
      setState(() {});
      controller.addListener(loop);
      //controller.play();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: controller.value.isInitialized ?
        Stack(children: [
          Positioned(child: AspectRatio(aspectRatio: controller.value.aspectRatio, child: GestureDetector(child: VideoPlayer(controller), onTap: pauseVideo,))),
          Positioned(child: AnimatedSwitcher(duration: const Duration(seconds: 1),
          child: started && isPlaying ? const SizedBox(height: 0,) : Container(width: widget.width, height: widget.width/(1920/1080), decoration: BoxDecoration(color: AppColors.backgroundColor.withOpacity(0.4)),),)),
          Positioned(left: 10, top: 10, child: AnimatedSwitcher(duration: const Duration(milliseconds: 500), child: started ? const SizedBox(height: 0,) : BoldedStandardText(text: widget.post.title ?? '', color: Colors.white,),)),
          Positioned(right: 5, bottom: 5, child: AnimatedSwitcher(duration: const Duration(milliseconds: 500), child: started ? const SizedBox(height: 0,) : GestureDetector(
              child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: widget.width/4,),
          onTap: startVideo,),))
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

  void loop() {
    if (controller.value.isInitialized && controller.value.position == controller.value.duration) {
      controller.play();
    }
  }

  void startVideo() {
    setState(() {
      started = !started;
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

}
