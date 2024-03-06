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
import 'package:firebase_auth/firebase_auth.dart';

class ShiguPlayrRecommendations extends StatefulWidget {
  const ShiguPlayrRecommendations({Key? key, this.width, this.height})
      : super(key: key);

  final double? width;
  final double? height;

  @override
  _ShiguPlayrRecommendationsState createState() =>
      _ShiguPlayrRecommendationsState();
}

class _ShiguPlayrRecommendationsState extends State<ShiguPlayrRecommendations> {
  late PageController _pageController;
  int _currentPage = 0;
  List<DocumentSnapshot> _videos = [];
  List<VideoPlayerController?> _controllers = List.filled(2, null);

  String? get currentUserReference {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _fetchVideos();
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  void _fetchVideos() async {
    String? userRef = currentUserReference;
    if (userRef == null) {
      return;
    }

    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userRef).get();
    List<String> userHashes = List<String>.from(userDoc['userHash'] ?? []);

    Query videoQuery = FirebaseFirestore.instance
        .collection('videos')
        .orderBy('dateUploaded', descending: true);
    videoQuery = videoQuery.where('videoHash', arrayContainsAny: userHashes);

    videoQuery.snapshots().listen((snapshot) {
      setState(() {
        _videos = snapshot.docs;

        _controllers = List.filled(_videos.length, null);

        for (int i = 0; i < min(2, _videos.length); i++) {
          _initializeController(i);
        }

        if (_videos.isNotEmpty && _currentPage < _videos.length) {
          final DocumentReference<Object?>? vidTempID = _videos[_currentPage]
              ['videoIDPassable'] as DocumentReference<Object?>?;
          FFAppState().update(() {
            FFAppState().tempVidID = vidTempID;
          });
        }
        if (_videos.isNotEmpty && _currentPage < _videos.length) {
          final DocumentReference<Object?>? creatorID =
              _videos[_currentPage]['creatorID'] as DocumentReference<Object?>?;
          FFAppState().update(() {
            FFAppState().tempCreatorID = creatorID;
          });
        }
      });
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _controllers[_currentPage]?.pause();
      if (_currentPage < index) {
        if (_currentPage - 1 >= 0) {
          _controllers[_currentPage - 1]?.dispose();
        }

        if (index + 1 < _videos.length) {
          _initializeController(index + 1);
        }
      } else if (_currentPage > index) {
        // user swiped backward
        if (_currentPage + 1 < _videos.length) {
          _controllers[_currentPage + 1]?.dispose();
        }

        if (index - 1 >= 0) {
          _initializeController(index - 1);
        }
      }

      _currentPage = index;

      if (_videos.isNotEmpty && index < _videos.length) {
        final DocumentReference<Object?>? vidTempID =
            _videos[index]['videoIDPassable'] as DocumentReference<Object?>?;
        FFAppState().update(() {
          FFAppState().tempVidID = vidTempID;
        });
      }
      if (_videos.isNotEmpty && _currentPage < _videos.length) {
        final DocumentReference<Object?>? creatorID =
            _videos[_currentPage]['creatorID'] as DocumentReference<Object?>?;
        FFAppState().update(() {
          FFAppState().tempCreatorID = creatorID;
        });
      }
      if (_videos.isNotEmpty && _currentPage < _videos.length) {
        final DocumentReference<Object?>? vidTempID = _videos[_currentPage]
            ['videoIDPassable'] as DocumentReference<Object?>?;
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
    _controllers[index] =
        VideoPlayerController.network(_videos[index]['videoUrl'])
          ..initialize().then((_) {
            setState(() {});
          });
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
          final creatorName =
              _videos[index]['creatorName'] as String? ?? 'Guest';
          final content = _videos[index]['content'] as String? ?? '';
          final userPhoto = _videos[index]['userPhoto'] as String? ?? '';
          final LikeCount = _videos[index]['LikeCount'] as int? ?? 0;
          final ShareCount = _videos[index]['ShareCount'] as int? ?? 0;
          final CommentCount = _videos[index]['CommentCount'] as int? ?? 0;
          return Stack(
            children: [
              TekPlay(controller: _controllers[index], videoUrl: videoUrl),
              // Play icon
              if (_controllers[index] != null &&
                  !_controllers[index]!.value.isPlaying)
                Center(
                  child: IconButton(
                    iconSize: 60.0,
                    icon: Icon(Icons.play_arrow_rounded,
                        color: Colors.white.withOpacity(0.0)),
                    onPressed: () {
                      setState(() {
                        _controllers[index]!.play();
                      });
                    },
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(-0.91, 0.96),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Container(
                    width: 277,
                    height: 112,
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  (creatorName),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      content,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            lineHeight: 2,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              child: Container(
                                width: 120,
                                height: 120,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  (userPhoto),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/itcb4313pnoy/icons8-like-104_(1).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        valueOrDefault<String>(
                          formatNumber(
                            LikeCount,
                            formatType: FormatType.compact,
                          ),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: 11,
                            ),
                      ),
                      SizedBox(height: 32),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/d0319ryrbnsr/icons8-speech-bubble-104.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                CommentCount,
                                formatType: FormatType.compact,
                              ),
                              '0',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/6rjy1h6ajww9/icons8-share-104.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                ShareCount,
                                formatType: FormatType.compact,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

void main() => runApp(TekPlay(controller: null, videoUrl: 'videoUrl'));

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
    _controller!.setLooping(true);
    // Comment out the following line to prevent auto-play
    // _controller!.play();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _controller != null
              ? VisibilityDetector(
                  key: Key('video'),
                  onVisibilityChanged: (visibilityInfo) {
                    var visiblePercentage =
                        visibilityInfo.visibleFraction * 100;

                    if (visiblePercentage < 50) {
                      _controller!.pause();
                      _isVideoPlaying = false;
                    } else {
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
                    child: _controller!.value.isInitialized
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
                                child: VideoProgressIndicator(
                                  _controller!,
                                  allowScrubbing: true,
                                  colors: VideoProgressColors(
                                    playedColor:
                                        Color.fromARGB(255, 255, 14, 199),
                                    bufferedColor: Colors.grey,
                                    backgroundColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
