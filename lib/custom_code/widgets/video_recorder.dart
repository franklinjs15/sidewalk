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
    required this.clipType,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String clipType;

  @override
  State<VideoRecorder> createState() => _VideoRecorderState();
}

class _VideoRecorderState extends State<VideoRecorder> {
  CameraController? _controller;
  List<CameraDescription> cameras = [];
  bool _isRecording = false;
  Timer? _recordingTimer;
  int _recordingDuration = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    FFAppState().currentClipType = widget.clipType;
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

    final size = MediaQuery.of(context).size;
    final viewportWidth = size.width * 0.98;
    final viewportHeight = viewportWidth * (16 / 9);

    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Container(
                width: viewportWidth,
                height: viewportHeight,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                child: CameraPreview(_controller!),
              ),
            ),
          ),
          if (_isRecording)
            Positioned(
              top: 60,
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
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: size.height * 0.20,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (_isRecording) {
                        final videoFile = await _stopRecording();
                        if (videoFile != null && context.mounted) {
                          // NEW: Just store the single video path based on clip type
                          FFAppState().update(() {
                            switch (widget.clipType) {
                              case 'rent':
                                FFAppState().rentClipPath = videoFile;
                                break;
                              case 'sales':
                                FFAppState().salesClipPath = videoFile;
                                break;
                              case 'employees':
                                FFAppState().employeesClipPath = videoFile;
                                break;
                            }
                          });

                          // Navigate to review with clip type
                          if (context.mounted) {
                            await context.pushNamed(
                              'reviewUpload',
                              queryParameters: {
                                'videoFile': videoFile,
                                'clipType': widget.clipType,
                              },
                            );
                          }
                        }
                      } else {
                        _startRecording();
                      }
                    },
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 8),
                        color: _isRecording ? Colors.red : Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(
                      Icons.flip_camera_ios,
                      color: Colors.white,
                      size: 38,
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
    );
  }
}
