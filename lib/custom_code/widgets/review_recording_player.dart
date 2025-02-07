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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:video_player/video_player.dart';

import 'dart:io' show File;

class ReviewRecordingPlayer extends StatefulWidget {
  const ReviewRecordingPlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoFile,
    required this.clipType,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoFile;
  final String clipType;

  @override
  _ReviewRecordingPlayerState createState() => _ReviewRecordingPlayerState();
}

class _ReviewRecordingPlayerState extends State<ReviewRecordingPlayer> {
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  TextEditingController _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializePlayer();
    // Load existing caption if any
    _loadExistingCaption();
  }

  void _loadExistingCaption() {
    String? existingCaption;
    switch (widget.clipType) {
      case 'rent':
        existingCaption = FFAppState().rentCaption;
        break;
      case 'sales':
        existingCaption = FFAppState().salesCaption;
        break;
      case 'employees':
        existingCaption = FFAppState().employeesCaption;
        break;
    }
    if (existingCaption != null && existingCaption.isNotEmpty) {
      _captionController.text = existingCaption;
    }
  }

  Future<void> _initializePlayer() async {
    _controller = VideoPlayerController.file(File(widget.videoFile));
    await _controller!.initialize();
    _controller!.addListener(() {
      if (mounted) {
        setState(() {
          _position = _controller!.value.position;
        });
      }
    });
    setState(() {
      _duration = _controller!.value.duration;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void _saveCaption(String caption) {
    switch (widget.clipType) {
      case 'rent':
        FFAppState().rentCaption = caption;
        break;
      case 'sales':
        FFAppState().salesCaption = caption;
        break;
      case 'employees':
        FFAppState().employeesCaption = caption;
        break;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 500,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_isPlaying) {
                            _controller!.pause();
                          } else {
                            _controller!.play();
                          }
                          _isPlaying = !_isPlaying;
                        });
                      },
                    ),
                    Text(
                      '${_formatDuration(_position)} / ${_formatDuration(_duration)}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Slider(
                  value: _position.inSeconds.toDouble(),
                  min: 0,
                  max: _duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    final newPosition = Duration(seconds: value.toInt());
                    _controller!.seekTo(newPosition);
                    setState(() {
                      _position = newPosition;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _captionController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Add a caption...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: _saveCaption,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
