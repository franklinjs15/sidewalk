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

// // Automatic FlutterFlow imports
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/widgets/index.dart'; // Imports other custom widgets
// import '/custom_code/actions/index.dart'; // Imports custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:video_player/video_player.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// class ProfilePlayer extends StatefulWidget {
//   const ProfilePlayer({
//     Key? key,
//     this.width,
//     this.height,
//     required this.videoUrls,
//     required this.index,
//   }) : super(key: key);

//   final double? width;
//   final double? height;
//   final List<String> videoUrls;
//   final int index;

//   @override
//   _ProfilePlayerState createState() => _ProfilePlayerState();
// }

// class _ProfilePlayerState extends State<ProfilePlayer> {
//   late PageController _pageController;
//   late int _currentPage;
//   late List<VideoPlayerController?> _controllers;

//   @override
//   void initState() {
//     super.initState();
//     _currentPage = widget.index;
//     _pageController = PageController(initialPage: _currentPage);
//     _controllers = List.generate(widget.videoUrls.length, (_) => null);
//     _initializeControllers();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     for (var controller in _controllers) {
//       controller?.dispose();
//     }
//     super.dispose();
//   }

//   void _initializeControllers() {
//     for (int i = 0; i < widget.videoUrls.length; i++) {
//       _controllers[i] = VideoPlayerController.network(widget.videoUrls[i])
//         ..initialize().then((_) {
//           setState(() {});
//         });
//     }
//   }

//   // void _onPageChanged(int index) {
//   //   setState(() {
//   //     _currentPage = index;

//   //     // Dispose of controllers not in the current or adjacent pages
//   //     for (int i = 0; i < _controllers.length; i++) {
//   //       if ((i - index).abs() > 1) {
//   //         _controllers[i]?.dispose();
//   //         _controllers[i] = null;
//   //       }
//   //     }

//   //     // Initialize controllers for current and adjacent pages
//   //     for (int i = index - 1; i <= index + 1; i++) {
//   //       if (i >= 0 && i < widget.videoUrls.length && _controllers[i] == null) {
//   //         _controllers[i] = VideoPlayerController.network(widget.videoUrls[i])
//   //           ..initialize().then((_) {
//   //             setState(() {});
//   //           });
//   //       }
//   //     }
//   //   });
//   // }

//   void _onPageChanged(int index) {
//     setState(() {
//       _currentPage = index;
//       FFAppState().update(() {
//         FFAppState().profileVideoIndex = index;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       scrollDirection: Axis.vertical,
//       controller: _pageController,
//       physics: BouncingScrollPhysics(),
//       pageSnapping: true,
//       itemCount: widget.videoUrls.length,
//       onPageChanged: _onPageChanged,
//       itemBuilder: (context, index) {
//         final videoUrl = widget.videoUrls[index];
//         return Scaffold(
//           backgroundColor: Colors.black,
//           body: Stack(
//             children: [
//               VisibilityDetector(
//                 key: Key('video_$index'),
//                 onVisibilityChanged: (visibilityInfo) {
//                   var visiblePercentage = visibilityInfo.visibleFraction * 100;

//                   if (visiblePercentage < 50) {
//                     _controllers[index]?.pause();
//                   } else {
//                     _controllers[index]?.play();
//                   }
//                 },
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _controllers[index]?.value.isPlaying ?? false
//                           ? _controllers[index]?.pause()
//                           : _controllers[index]?.play();
//                     });
//                   },
//                   child: _controllers[index]?.value.isInitialized ?? false
//                       ? Stack(
//                           children: [
//                             Center(
//                               //child: AspectRatio(
//                               //   aspectRatio:
//                               //       _controllers[index]!.value.aspectRatio,
//                               //   child: VideoPlayer(_controllers[index]!),
//                               // ),
//                               child: FittedBox(
//                                 fit: BoxFit
//                                     .cover, // Ensures the video fills the entire screen
//                                 child: SizedBox(
//                                   width: _controllers[index]!.value.size.width,
//                                   height:
//                                       _controllers[index]!.value.size.height,
//                                   child: VideoPlayer(_controllers[index]!),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 20,
//                               left: 0,
//                               right: 0,
//                               child: VideoProgressIndicator(
//                                 _controllers[index]!,
//                                 allowScrubbing: true,
//                                 colors: VideoProgressColors(
//                                   playedColor:
//                                       Color.fromARGB(255, 14, 227, 255),
//                                   bufferedColor: Colors.grey,
//                                   backgroundColor: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       : SizedBox.shrink(),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// } Old but keep!

import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ProfilePlayer extends StatefulWidget {
  const ProfilePlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoUrls,
    required this.index,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> videoUrls;
  final int index;

  @override
  _ProfilePlayerState createState() => _ProfilePlayerState();
}

class _ProfilePlayerState extends State<ProfilePlayer> {
  late PageController _pageController;
  late int _currentPage;
  late List<VideoPlayerController?> _controllers;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.index;
    _pageController = PageController(initialPage: _currentPage);
    _controllers = List.generate(widget.videoUrls.length, (_) => null);
    _initializeControllers();
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  Future<VideoPlayerController> _getCachedVideoController(String url) async {
    final file = await DefaultCacheManager().getSingleFile(url);
    return VideoPlayerController.file(file);
  }

  void _initializeControllers() {
    for (int i = _currentPage - 1; i <= _currentPage + 1; i++) {
      if (i >= 0 && i < widget.videoUrls.length) {
        _getCachedVideoController(widget.videoUrls[i]).then((controller) {
          _controllers[i] = controller
            ..initialize().then((_) {
              setState(() {});
            }).catchError((error) {
              debugPrint('Video initialization error: $error');
            });
        });
      }
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      FFAppState().update(() {
        FFAppState().profileVideoIndex = index;
      });

      for (int i = 0; i < _controllers.length; i++) {
        if ((i - index).abs() > 1 && _controllers[i] != null) {
          _controllers[i]?.dispose();
          _controllers[i] = null;
        }
      }

      for (int i = index - 1; i <= index + 1; i++) {
        if (i >= 0 && i < widget.videoUrls.length && _controllers[i] == null) {
          _getCachedVideoController(widget.videoUrls[i]).then((controller) {
            _controllers[i] = controller
              ..initialize().then((_) {
                setState(() {});
              }).catchError((error) {
                debugPrint('Video initialization error: $error');
              });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      physics: BouncingScrollPhysics(),
      pageSnapping: true,
      itemCount: widget.videoUrls.length,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        final videoUrl = widget.videoUrls[index];
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              VisibilityDetector(
                key: Key('video_$index'),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;

                  if (visiblePercentage < 50) {
                    _controllers[index]?.pause();
                  } else {
                    _controllers[index]?.play();
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _controllers[index]?.value.isPlaying ?? false
                          ? _controllers[index]?.pause()
                          : _controllers[index]?.play();
                    });
                  },
                  child: _controllers[index]?.value.isInitialized ?? false
                      ? SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: SizedBox(
                              width: _controllers[index]!.value.size.width,
                              height: _controllers[index]!.value.size.height,
                              child: VideoPlayer(_controllers[index]!),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 7.0,
                  child: _controllers[index]?.value.isInitialized ?? false
                      ? VideoProgressIndicator(
                          _controllers[index]!,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            playedColor: Color.fromARGB(255, 11, 162, 250),
                            bufferedColor: Colors.grey,
                            backgroundColor: Colors.black,
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
