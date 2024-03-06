// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Custom code developed by Teknesis LLC (do not remove this line!)
//This code is used with custom API

import 'dart:io';

import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() => runApp(ReviewRecordingPlayer(videoFile: 'videoUrl'));

class ReviewRecordingPlayer extends StatefulWidget {
  final String videoFile;
  final double? width;
  final double? height;

  const ReviewRecordingPlayer({
    Key? key,
    required this.videoFile,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _ReviewRecordingPlayerState createState() => _ReviewRecordingPlayerState();
}

class _ReviewRecordingPlayerState extends State<ReviewRecordingPlayer> {
  VideoPlayerController? _controller;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(File(widget.videoFile))
      ..initialize().then((_) {
        setState(() {
          _controller!.setLooping(true);
          _controller!.setVolume(1);
        });
      });

    _controller!.play();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void onVisibilityChanged(VisibilityInfo info) {
    // You can add visibility handling here if needed
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TekPlay',
      home: GestureDetector(
        onTap: () {},
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              _controller != null && _controller!.value.isInitialized
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isVideoPlaying = !_isVideoPlaying;
                          if (_controller != null) {
                            _isVideoPlaying
                                ? _controller!.play()
                                : _controller!.pause();
                          }
                        });
                      },
                      child: VisibilityDetector(
                        key: Key(widget.videoFile),
                        onVisibilityChanged: onVisibilityChanged,
                        child: Center(
                          child: SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: _controller!.value.size.width,
                                    height: _controller!.value.size.height,
                                    child: VideoPlayer(_controller!),
                                  ),
                                  if (!_isVideoPlaying)
                                    Center(
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.0),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: const Color.fromARGB(
                                              157, 255, 255, 255),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
