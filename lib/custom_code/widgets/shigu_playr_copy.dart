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

// Custom code developed by Teknesis LLC (do not remove this line!)
import 'dart:async'; // Import to use Timer
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// Add your TypewriterText widget here
// class TypewriterText extends StatefulWidget {
//   final String text;
//   final TextStyle? textStyle;
//   final Duration speed;

//   const TypewriterText({
//     Key? key,
//     required this.text,
//     this.textStyle,
//     this.speed = const Duration(milliseconds: 100),
//   }) : super(key: key);

//   @override
//   _TypewriterTextState createState() => _TypewriterTextState();
// }

// class _TypewriterTextState extends State<TypewriterText> {
//   String _displayedText = '';
//   late Timer _timer;
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _startTyping();
//   }

//   void _startTyping() {
//     _timer = Timer.periodic(widget.speed, (timer) {
//       if (_currentIndex < widget.text.length) {
//         setState(() {
//           _displayedText += widget.text[_currentIndex];
//         });
//         _currentIndex++;
//       } else {
//         _timer.cancel();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       _displayedText,
//       style: widget.textStyle,
//     );
//   }
// }

// Shigur beings and test end
class ShiguPlayr extends StatefulWidget {
  const ShiguPlayr({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ShiguPlayrState createState() => _ShiguPlayrState();
}

class _ShiguPlayrState extends State<ShiguPlayr> {
  late PageController _pageController;
  int _currentPage = 0;
  List<DocumentSnapshot> _videos = [];
  List<VideoPlayerController?> _controllers = List.filled(2, null);
  Timer? _nudgeTimer;
  bool _hasNudged = false;
  DateTime? _videoStartTime;
  DateTime? _videoEndTime;
  FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  String? get currentUserReference {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  DocumentReference? _lastSelectedIndustry;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _lastSelectedIndustry = FFAppState().currentSelectedIndustry;
    _fetchVideos();

    // Listen for changes to currentSelectedIndustry in FFAppState
    FFAppState().addListener(() {
      final currentIndustry = FFAppState().currentSelectedIndustry;

      // Only fetch videos if the industry changes
      if (_lastSelectedIndustry != currentIndustry) {
        _lastSelectedIndustry = currentIndustry;
        _fetchVideos();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _disposeControllers();
    _nudgeTimer?.cancel();
    super.dispose();
  }

  void _disposeControllers() {
    for (var controller in _controllers) {
      controller?.dispose();
    }
  }

  void _fetchVideos() {
    // Cancel the previous subscription if it exists
    final DocumentReference? industryRef = FFAppState().currentSelectedIndustry;

    /* Query query = FirebaseFirestore.instance
      .collection('videos')
      .orderBy('dateUploaded', descending: true);*/

    if (industryRef != null) {
      FirebaseFirestore.instance
          .collection('videos')
          .where('Industry.industry_ref', isEqualTo: industryRef)
          .orderBy('dateUploaded', descending: true)
          .snapshots()
          .listen((snapshot) {
        setState(() {
          _videos = snapshot.docs;
          _videos.shuffle();

          _controllers = List.filled(_videos.length, null);

          for (int i = 0; i < min(2, _videos.length); i++) {
            _initializeController(i);
          }

          _updateAppStateForCurrentVideo(_currentPage);
        });
      });
    } else {
      FirebaseFirestore.instance
          .collection('videos')
          .orderBy('dateUploaded', descending: true)
          .snapshots()
          .listen((snapshot) {
        setState(() {
          _videos = snapshot.docs;
          _videos.shuffle();

          _controllers = List.filled(_videos.length, null);

          for (int i = 0; i < min(2, _videos.length); i++) {
            _initializeController(i);
          }

          _updateAppStateForCurrentVideo(_currentPage);
        });
      });
    }
  }

  Future<int> _fetchCommentCount(int index) async {
    if (index >= _videos.length) return 0;

    final videoRef =
        _videos[index]['videoIDPassable'] as DocumentReference<Object?>?;
    if (videoRef == null) return 0;

    final countQuery = await FirebaseFirestore.instance
        .collection('comments')
        .where('video_ref', isEqualTo: videoRef)
        .count()
        .get();

    return countQuery.count ?? 0; // Get the count directly
  }

  void _updateAppStateForCurrentVideo(int index) {
    if (_videos.isNotEmpty && index < _videos.length) {
      final vidTempID =
          _videos[index]['videoIDPassable'] as DocumentReference<Object?>?;
      final creatorID =
          _videos[index]['creatorID'] as DocumentReference<Object?>?;
      final videoData = _videos[index].data() as Map<String, dynamic>?;

      FFAppState().update(() {
        FFAppState().tempVidID = vidTempID;
        FFAppState().tempCreatorID = creatorID;
      });

      if (videoData != null &&
          videoData.containsKey('videoHash') &&
          videoData['videoHash'] is List &&
          videoData['videoHash'].isNotEmpty) {
        String? firstHash = videoData['videoHash'][0] as String?;
        String? userRef = currentUserReference;
        if (firstHash != null && userRef != null) {
          FirebaseFirestore.instance.collection('users').doc(userRef).update({
            'userHash': FieldValue.arrayUnion([firstHash])
          });
        }
      }
    }
  }

  void _logVideoStart(int index) {
    _videoStartTime = DateTime.now();

    final videoRef =
        _videos[index]['videoIDPassable'] as DocumentReference<Object?>?;
    final videoId = videoRef?.id ?? 'unknown_video';
    final userId = currentUserReference ?? 'anonymous_user';
    final categories =
        _videos[index]['Categories'] as List<dynamic>? ?? ['unknown_category'];

    for (var category in categories) {
      _analytics.logEvent(
        name: 'video_start',
        parameters: {
          'video_id': videoId,
          'user_id': userId,
          'category': category,
        },
      );

      _analytics.logEvent(
        name: 'category_view_start',
        parameters: {
          'category': category,
          'user_id': userId,
        },
      );
    }
  }

  void _logVideoEnd(int index) {
    _videoEndTime = DateTime.now();
    if (_videoStartTime != null && _videoEndTime != null) {
      final timeSpent = _videoEndTime!.difference(_videoStartTime!).inSeconds;

      final videoRef =
          _videos[index]['videoIDPassable'] as DocumentReference<Object?>?;
      final videoId = videoRef?.id ?? 'unknown_video';
      final userId = currentUserReference ?? 'anonymous_user';
      final categories = _videos[index]['Categories'] as List<dynamic>? ??
          ['unknown_category'];

      for (var category in categories) {
        _analytics.logEvent(
          name: 'video_end',
          parameters: {
            'video_id': videoId,
            'user_id': userId,
            'time_spent': timeSpent,
            'category': category,
          },
        );

        _analytics.logEvent(
          name: 'category_view_end',
          parameters: {
            'category': category,
            'user_id': userId,
            'time_spent': timeSpent,
          },
        );
      }
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      if (_currentPage < _videos.length) {
        _logVideoEnd(_currentPage);
      }

      _controllers[_currentPage]?.pause();

      if (_currentPage < index) {
        if (_currentPage - 1 >= 0) {
          _controllers[_currentPage - 1]?.dispose();
        }
        if (index + 1 < _videos.length) {
          _initializeController(index + 1);
        }
      } else if (_currentPage > index) {
        if (_currentPage + 1 < _videos.length) {
          _controllers[_currentPage + 1]?.dispose();
        }
        if (index - 1 >= 0) {
          _initializeController(index - 1);
        }
      }

      _currentPage = index;

      if (_currentPage < _videos.length) {
        _logVideoStart(index);
      }

      _updateAppStateForCurrentVideo(index);

      if (_videos.isNotEmpty && index < _videos.length) {
        final vidTempID =
            _videos[index]['videoIDPassable'] as DocumentReference<Object?>?;
        if (vidTempID != null &&
            !FFAppState().watchHistory.contains(vidTempID)) {
          FFAppState().update(() {
            FFAppState().watchHistory.add(vidTempID);
          });
        }
      }
    });
  }

  void _initializeController(int index) {
    _controllers[index]?.dispose();
    final videoUrl = _videos[index]['videoUrl'] as String?;
    if (videoUrl != null && videoUrl.isNotEmpty) {
      _controllers[index] = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      physics: BouncingScrollPhysics(),
      pageSnapping: true,
      itemCount: _videos.length,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        final videoUrl = _videos[index]['videoUrl'] as String? ?? '';
        final creatorName = _videos[index]['creatorName'] as String? ?? 'Guest';
        final content = _videos[index]['content'] as String? ?? '';
        final userPhoto = _videos[index]['userPhoto'] as String? ?? '';
        final likeCount = _videos[index]['LikeCount'] as int? ?? 0;
        final shareCount = _videos[index]['ShareCount'] as int? ?? 0;

        return FutureBuilder<int>(
          future: _fetchCommentCount(index),
          builder: (context, snapshot) {
            final commentCount = snapshot.data ?? 0;

            return Stack(
              children: [
                TekPlay(controller: _controllers[index], videoUrl: videoUrl),
                // Align(
                //   alignment:
                //       Alignment.center, // Align in the middle of the page
                //   child: Padding(
                //     padding: EdgeInsets.all(16), // Adjust padding as needed
                //     child: content.isNotEmpty // Only show if content exists
                //         ? Container(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: 10, vertical: 10),
                //             decoration: BoxDecoration(
                //               color: Colors.black.withOpacity(
                //                   0.6), // Semi-transparent background
                //               borderRadius:
                //                   BorderRadius.circular(15), // Rounded corners
                //             ),
                //             child: Text(
                //               content, // Content text here
                //               textAlign: TextAlign.center,
                //               style: FlutterFlowTheme.of(context)
                //                   .bodyMedium
                //                   .override(
                //                     fontFamily: 'Bangers',
                //                     color: const Color.fromARGB(
                //                         255, 253, 253, 253),
                //                     fontSize: 35,
                //                   ),
                //             ),
                //           )
                //         : Container(), // Empty widget if content is empty
                //   ),
                // ),
                // Align(
                //   alignment:
                //       Alignment.center, // Align in the middle of the page
                //   child: Padding(
                //     padding: EdgeInsets.all(16), // Adjust padding as needed
                //     child: Container(
                //       padding: EdgeInsets.all(16), // Content padding
                //       child: content.isNotEmpty // Only show if content exists
                //           ? Padding(
                //               padding: const EdgeInsets.only(top: 8.0),
                //               child: Stack(
                //                 children: [
                //                   // Outline text
                //                   // TypewriterText(
                //                   //   text: content, // Content text here
                //                   //   speed: Duration(
                //                   //       milliseconds:
                //                   //           70), // Adjust typing speed
                //                   //   textStyle: TextStyle(
                //                   //     fontFamily: 'Bangers', // Font style
                //                   //     fontSize: 30, // Font size
                //                   //     foreground: Paint()
                //                   //       ..style = PaintingStyle.stroke
                //                   //       ..strokeWidth = 3 // Outline thickness
                //                   //       ..color = Colors.black, // Outline color
                //                   //   ),
                //                   // ),
                //                   // // Main white text
                //                   // TypewriterText(
                //                   //   text: content, // Content text here
                //                   //   speed: Duration(
                //                   //       milliseconds:
                //                   //           70), // Adjust typing speed
                //                   //   textStyle: TextStyle(
                //                   //     fontFamily: 'Bangers', // Font style
                //                   //     fontSize: 30, // Font size
                //                   //     color: Colors.white, // Main text color
                //                   //   ),
                //                   // ),
                //                 ],
                //               ),
                //             )
                //           : Container(), // Empty container if no content
                //     ),
                //   ),
                // ),
                // Align(
                //   alignment:
                //       Alignment.center, // Align in the middle of the page
                //   child: Padding(
                //     padding: EdgeInsets.all(16), // Adjust padding as needed
                //     child: Container(
                //       padding: EdgeInsets.all(16), // Content padding
                //       child: content.isNotEmpty // Only show if content exists
                //           ? Padding(
                //               padding: const EdgeInsets.only(top: 8.0),
                //               child: Stack(
                //                 children: [
                //                   // Outline text
                //                   // TypewriterText(
                //                   //   text: content, // Content text here
                //                   //   speed: Duration(
                //                   //       milliseconds:
                //                   //           70), // Adjust typing speed
                //                   //   textStyle: TextStyle(
                //                   //     fontFamily: 'Bangers', // Font style
                //                   //     fontSize: 30, // Font size
                //                   //     foreground: Paint()
                //                   //       ..style = PaintingStyle.stroke
                //                   //       ..strokeWidth = 3 // Outline thickness
                //                   //       ..color = Colors.black, // Outline color
                //                   //   ),
                //                   // ),
                //                   // Main white text
                //                   // TypewriterText(
                //                   //   text: content, // Content text here
                //                   //   speed: Duration(
                //                   //       milliseconds:
                //                   //           70), // Adjust typing speed
                //                   //   textStyle: FlutterFlowTheme.of(context)
                //                   //       .bodyMedium
                //                   //       .override(
                //                   //         fontFamily: 'Bangers',
                //                   //         color: const Color.fromARGB(
                //                   //             255, 38, 243, 72),
                //                   //         fontSize: 45,
                //                   //       ),
                //                   // ),
                //                 ],
                //               ),
                //             )
                //           : Container(), // Empty container if no content
                //     ),
                //   ),
                // ),
                Align(
                  alignment: AlignmentDirectional(-0.99999, 0.985),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: Container(
                      width: 250,
                      height: 60,
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.5,
                        maxWidth: MediaQuery.of(context).size.width * 0.99999,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color.fromARGB(2, 7, 7, 7),
                            Color.fromARGB(2, 7, 7, 7),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(100, 0, 0, 0),
                            blurRadius: 35,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 6, 36, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                //below is a test
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    creatorName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                              // if (content
                              //     .isNotEmpty) // Only show if content exists
                              //   Padding(
                              //     padding: const EdgeInsets.only(top: 8.0),
                              //     child: TypewriterText(
                              //       text: content,
                              //       speed: Duration(
                              //           milliseconds:
                              //               70), // Adjust typing speed here
                              //       textStyle: FlutterFlowTheme.of(context)
                              //           .bodyMedium
                              //           .override(
                              //             fontFamily: 'Bangers',
                              //             color: Colors.grey[300],
                              //             fontSize: 14,
                              //           ),
                              //     ),
                              //   ),
                              // Row(
                              //   mainAxisSize: MainAxisSize.max,
                              //   children: [
                              //     Text(
                              //       creatorName,
                              //       style: FlutterFlowTheme.of(context)
                              //           .bodyMedium
                              //           .override(
                              //             fontFamily: 'Outfit',
                              //             color: Colors.white,
                              //             fontSize: 17,
                              //             fontWeight: FontWeight.w600,
                              //           ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        UserAvatar(userPhoto: userPhoto),
                        SizedBox(height: 32),
                        EngagementIcon(
                          iconUrl:
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/qk60ew7fc05v/sidewalk_research-40.png',
                          count: likeCount,
                        ),
                        SizedBox(height: 20),
                        EngagementIcon(
                          iconUrl:
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/xrd53lr13abu/ddhaosd.png',
                          count: commentCount,
                        ),
                        SizedBox(height: 20),
                        EngagementIcon(
                          iconUrl:
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/iquuolrxld3n/share_button.png',
                          count: shareCount,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class TekPlay extends StatefulWidget {
  final VideoPlayerController? controller;
  final String videoUrl;
  final double? width;
  final double? height;

  const TekPlay(
      {Key? key,
      this.controller,
      required this.videoUrl,
      this.width,
      this.height})
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
    _controller = widget.controller;
    if (_controller != null) {
      _controller!.setLooping(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (_controller != null)
            VisibilityDetector(
              key: Key('video'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;

                if (visiblePercentage < 50 && _controller != null) {
                  _controller!.pause();
                  _isVideoPlaying = false;
                } else if (_controller != null) {
                  _controller!.play();
                  _isVideoPlaying = true;
                }
              },
              child: GestureDetector(
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
                child: _controller != null && _controller!.value.isInitialized
                    ? Stack(
                        children: [
                          Center(
                            child: SizedBox.expand(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width: _controller!.value.size.width,
                                  height: _controller!.value.size.height,
                                  child: VideoPlayer(_controller!),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              height:
                                  7.0, // Adjust the height of the progress bar
                              child: VideoProgressIndicator(
                                _controller!,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                  playedColor:
                                      Color.fromARGB(255, 11, 162, 250),
                                  bufferedColor: Color.fromARGB(0, 0, 0, 0),
                                  backgroundColor: Color.fromARGB(0, 0, 0, 0),
                                ),
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

class UserAvatar extends StatelessWidget {
  final String userPhoto;

  const UserAvatar({Key? key, required this.userPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color.fromARGB(255, 255, 50, 115),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color.fromARGB(255, 253, 255, 107),
          ],
          tileMode: TileMode.mirror,
        ),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
            child: Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                userPhoto.isNotEmpty ? userPhoto : 'default_user_photo_url',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EngagementIcon extends StatelessWidget {
  final String iconUrl;
  final int count;

  const EngagementIcon({Key? key, required this.iconUrl, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            iconUrl.isNotEmpty ? iconUrl : 'default_icon_url',
            fit: BoxFit.cover,
          ),
        ),
        Text(
          valueOrDefault<String>(
            formatNumber(
              count,
              formatType: FormatType.compact,
            ),
            '0',
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 15,
              ),
        ),
      ],
    );
  }
}
