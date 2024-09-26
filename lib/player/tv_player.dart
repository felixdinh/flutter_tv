import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'custom_controls.dart';

class TvPlayer extends StatefulWidget {
  const TvPlayer({super.key});

  @override
  State<TvPlayer> createState() => _TvPlayerState();
}

class _TvPlayerState extends State<TvPlayer> {
  late final player = Player();
  late final videoController = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media('https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Video(
        controller: videoController,
        controls: (state) => TVVideoControls(state),
      ),
    );
  }
}
