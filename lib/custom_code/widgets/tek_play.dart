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

import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TekPlay extends StatefulWidget {
  final String videoUrl;
  final double? width;
  final double? height;

  const TekPlay({Key? key, required this.videoUrl, this.width, this.height})
      : super(key: key);

  @override
  _TekPlayState createState() => _TekPlayState();
}

class _TekPlayState extends State<TekPlay> {
  VideoPlayerController? _controller;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller!.setLooping(true);
        });
      });

    _controller!.play();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void onVisibilityChanged(VisibilityInfo info) {}

  @override
  Widget build(BuildContext context) {
    bool isMuted = FFAppState().isMuted;
    _controller!.setVolume(isMuted ? 0.0 : 1.0);

    return MaterialApp(
      title: 'TekPlay',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            _controller != null
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
                      key: Key(widget.videoUrl),
                      onVisibilityChanged: onVisibilityChanged,
                      child: _controller != null &&
                              _controller!.value.isInitialized
                          ? Center(
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
                                              color:
                                                  Colors.white.withOpacity(0.0),
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
                            )
                          : SizedBox.shrink(),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
