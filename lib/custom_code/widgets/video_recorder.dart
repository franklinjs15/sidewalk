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

import 'package:camera/camera.dart';
import 'dart:async';

class VideoRecorder extends StatefulWidget {
  const VideoRecorder({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<VideoRecorder> createState() => _VideoRecorderState();
}

class _VideoRecorderState extends State<VideoRecorder> {
  CameraController? _controller;
  List<CameraDescription> cameras = [];
  bool _isRecording = false;
  Timer? _recordingTimer;
  int _recordingDuration = 0;
  bool _showGrid = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.high,
        enableAudio: true,
      );

      await _controller!.initialize();
      if (mounted) setState(() {});
    }
  }

  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _startRecording() async {
    if (!_controller!.value.isRecordingVideo) {
      try {
        await _controller!.startVideoRecording();
        setState(() {
          _isRecording = true;
          _recordingDuration = 0;
        });

        _recordingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            _recordingDuration++;
          });
        });
      } catch (e) {
        print('Error starting recording: $e');
      }
    }
  }

  Future<String?> _stopRecording() async {
    if (_controller!.value.isRecordingVideo) {
      _recordingTimer?.cancel();
      try {
        final XFile videoFile = await _controller!.stopVideoRecording();
        setState(() {
          _isRecording = false;
        });
        return videoFile.path;
      } catch (e) {
        print('Error stopping recording: $e');
        return null;
      }
    }
    return null;
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.black,
        child: Stack(
          children: [
            // Camera Preview
            CameraPreview(_controller!),

            // Grid Overlay
            if (_showGrid)
              CustomPaint(
                size: Size.infinite,
                painter: GridPainter(),
              ),

            // Recording Timer
            if (_isRecording)
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          _formatDuration(_recordingDuration),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Control Buttons - Moved higher up
            Positioned(
              bottom: MediaQuery.of(context).size.height *
                  0.2, // Position at 20% from bottom
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        _showGrid ? Icons.grid_on : Icons.grid_off,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        setState(() {
                          _showGrid = !_showGrid;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_isRecording) {
                          final videoFile = await _stopRecording();
                          if (videoFile != null && context.mounted) {
                            print(
                                'Exact Video Path: $videoFile'); // Added logging

                            try {
                              if (context.mounted) {
                                await context.pushNamed(
                                  'reviewUpload',
                                  queryParameters: {
                                    'videoFile':
                                        videoFile, // Pass the exact path
                                  },
                                );
                              }
                            } catch (e) {
                              print('Navigation error: $e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Error navigating to review: $e')),
                              );
                            }
                          }
                        } else {
                          _startRecording();
                        }
                      },
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          color: _isRecording ? Colors.red : Colors.transparent,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.flip_camera_ios,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () async {
                        final newCameraIndex =
                            _controller!.description == cameras[0] ? 1 : 0;
                        if (cameras.length > newCameraIndex) {
                          await _controller!.dispose();
                          _controller = CameraController(
                            cameras[newCameraIndex],
                            ResolutionPreset.high,
                            enableAudio: true,
                          );
                          await _controller!.initialize();
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1;

    // Vertical lines
    for (int i = 1; i < 3; i++) {
      double x = size.width * i / 3;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Horizontal lines
    for (int i = 1; i < 3; i++) {
      double y = size.height * i / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
