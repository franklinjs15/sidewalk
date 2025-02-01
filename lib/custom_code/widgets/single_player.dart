// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  _SinglePlayerState createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          VisibilityDetector(
            key: Key('video_0'),
            onVisibilityChanged: (visibilityInfo) {
              var visiblePercentage = visibilityInfo.visibleFraction * 100;

              if (visiblePercentage < 50) {
                _controller.pause();
              } else {
                _controller.play();
              }
            },
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying ?? false
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: _controller.value.isInitialized ?? false
                  ? Stack(
                      children: [
                        Center(
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                            colors: VideoProgressColors(
                              playedColor: Color.fromARGB(255, 14, 227, 255),
                              bufferedColor: Colors.grey,
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
