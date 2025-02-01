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

import 'index.dart'; // Imports other custom widgets

import 'package:flutter/services.dart'; // Add this for HapticFeedback

// import '/custom_code/widgets/index.dart';
// import '/custom_code/actions/index.dart';
// import '/flutter_flow/custom_functions.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// ======== StoriesSection Widget ========
class StoriesSection extends StatefulWidget {
  const StoriesSection({Key? key}) : super(key: key);

  @override
  _StoriesSectionState createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<StoriesSection> {
  List<DocumentSnapshot> _users = [];
  bool _isVisible = true;
  double _lastScrollOffset = 0;
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchRecentUsers();
  }

  Future<void> _fetchRecentUsers() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('photo_url', isNotEqualTo: '')
          .limit(20)
          .get();

      if (mounted) {
        setState(() {
          _users = snapshot.docs..shuffle();
        });
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 88, // Reduced from 125
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color.fromARGB(240, 236, 240, 248)!,
                  width: 5.0, // Reduced from 7.0
                ),
              ),
            ),
            child: ListView.builder(
              controller: _horizontalScrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                  horizontal: 6, vertical: 7), // Reduced from 8,10
              itemCount: _users.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8), // Reduced from 12
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Recently',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 8, // Reduced from 11
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                        ),
                        Text(
                          'joined',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 8, // Reduced from 11
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                        ),
                        Text(
                          'shops',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 8, // Reduced from 11
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                        ),
                        Text(
                          '→',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 11, // Reduced from 16
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                        ),
                      ],
                    ),
                  );
                }

                final user = _users[index - 1].data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 3), // Reduced from 4
                  child: GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        final userDoc = _users[index - 1];
                        final userRef = userDoc.reference;

                        if (userRef != null) {
                          FFAppState().update(() {
                            FFAppState().tempCreatorID = userRef;
                          });

                          await context.pushNamed(
                            'PublicProfileCopy',
                            pathParameters: {
                              'userRef': userRef.id,
                            },
                          );
                        }
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 55, // Reduced from 78
                          height: 55, // Reduced from 78
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFFD600),
                                Color(0xFFFF7A00),
                                Color(0xFFFF0069),
                                Color(0xFFD300C5),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.circular(
                                27.5), // Adjusted for new size
                          ),
                          padding: const EdgeInsets.all(1.4), // Reduced from 2
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  26), // Adjusted for new size
                            ),
                            padding:
                                const EdgeInsets.all(1.4), // Reduced from 2
                            child: CircleAvatar(
                              radius: 24.5, // Reduced from 35
                              backgroundImage: NetworkImage(
                                user['photo_url'] ??
                                    '/api/placeholder/42/42', // Reduced from 60/60
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3), // Reduced from 4
                        SizedBox(
                          width: 52, // Reduced from 74
                          child: Text(
                            user['ShopName'] ?? 'Shop',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 8, // Reduced from 12
                                  fontWeight: FontWeight.w500,
                                  color: [
                                    Color(0xFF4285F4),
                                    Color(0xFFDB4437),
                                    Color(0xFFF4B400),
                                    Color(0xFF0F9D58),
                                  ][index % 4],
                                  letterSpacing: 0.35, // Reduced from 0.5
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} // End of StoriesSection

// ======== ShiguPlayr Widget ========
class ShiguPlayr extends StatefulWidget {
  const ShiguPlayr({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ShiguPlayrState createState() => _ShiguPlayrState();
}

class _ShiguPlayrState extends State<ShiguPlayr> {
  late ScrollController _scrollController;
  List<DocumentSnapshot> _videos = [];
  Map<int, VideoPlayerController?> _controllers = {};
  DocumentReference? _replyingToComment;
  final TextEditingController _replyController = TextEditingController();
  // Map<int, bool> _isMuted = {};
  bool _isGloballyMuted = false;
  bool _initialLoadDone = false;
  Map<String, bool> _bookmarkedPosts = {};
  Map<String, bool> _likedPosts = {};
  DocumentReference? _lastSelectedIndustry;
  FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  DateTime? _videoStartTime;
  DateTime? _videoEndTime;
  bool _isStoriesVisible = true;
  double _lastScrollOffset = 0;
  String? _replyingToName;

  final TextEditingController _commentController = TextEditingController();

  String? get currentUserReference {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _lastSelectedIndustry = FFAppState().currentSelectedIndustry;
    _fetchVideos();

    _scrollController.addListener(() {
      final currentScroll = _scrollController.offset;
      setState(() {
        _isStoriesVisible =
            currentScroll < _lastScrollOffset || currentScroll < 50;
        _lastScrollOffset = currentScroll;
      });
    });

    FFAppState().addListener(() {
      final currentIndustry = FFAppState().currentSelectedIndustry;
      if (_lastSelectedIndustry != currentIndustry) {
        _lastSelectedIndustry = currentIndustry;
        _fetchVideos();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controllers.forEach((_, controller) => controller?.dispose());
    _commentController.dispose();
    super.dispose();
  }

  void _fetchVideos() async {
    final DocumentReference? industryRef = FFAppState().currentSelectedIndustry;

    Query query = industryRef != null
        ? FirebaseFirestore.instance
            .collection('videos')
            .where('Industry.industry_ref', isEqualTo: industryRef)
            .orderBy('dateUploaded', descending: true)
        : FirebaseFirestore.instance
            .collection('videos')
            .orderBy('dateUploaded', descending: true);

    final snapshot = await query.get(); // Changed from snapshots() to get()
    if (mounted) {
      setState(() {
        _videos = snapshot.docs;
        _videos.shuffle();
        _controllers.clear();
        for (int i = 0; i < min(2, _videos.length); i++) {
          _initializeController(i);
        }
      });
    }
  }

  void _initializeController(int index) {
    _controllers[index]?.dispose();
    final videoUrl = _videos[index]['videoUrl'] as String?;
    if (videoUrl != null && videoUrl.isNotEmpty) {
      _controllers[index] = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          _controllers[index]?.setVolume(_isGloballyMuted ? 0.0 : 1.0);
          _controllers[index]?.seekTo(Duration.zero);
          _controllers[index]?.pause();
          setState(() {});
        })
        ..setLooping(true);
    }
  }

  Future<void> _toggleBookmark(
      String videoId, DocumentReference videoRef) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please sign in to bookmark posts')),
      );
      return;
    }
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
    final bookmarkRef = FirebaseFirestore.instance
        .collection('bookmarks')
        .doc('${currentUser.uid}_$videoId');
    try {
      final bookmarkDoc = await bookmarkRef.get();

      if (bookmarkDoc.exists) {
        // Remove bookmark
        await bookmarkRef.delete();
        setState(() {
          _bookmarkedPosts[videoId] = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bookmark removed')),
        );
      } else {
        // Add bookmark
        await bookmarkRef.set({
          'user_ref': userRef,
          'video_ref': videoRef,
          'created_at': FieldValue.serverTimestamp(),
        });
        setState(() {
          _bookmarkedPosts[videoId] = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bookmark added')),
        );
      }
      HapticFeedback.mediumImpact();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating bookmark: $e')),
      );
    }
  }

  Future<void> _checkBookmarkStatus(String videoId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    final bookmarkRef = FirebaseFirestore.instance
        .collection('bookmarks')
        .doc("${currentUser.uid}_$videoId");

    try {
      final bookmarkDoc = await bookmarkRef.get();
      setState(() {
        _bookmarkedPosts[videoId] = bookmarkDoc.exists;
      });
    } catch (e) {
      print('Error checking bookmark status: $e');
    }
  }

  Future<void> _toggleLike(String videoId, DocumentReference videoRef) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please sign in to like posts')),
      );
      return;
    }

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
    final likeRef = FirebaseFirestore.instance
        .collection('likes')
        .doc('${currentUser.uid}_$videoId');

    try {
      final likeDoc = await likeRef.get();

      if (likeDoc.exists) {
        // Remove like
        await likeRef.delete();
        await videoRef.update({
          'LikeCount': FieldValue.increment(-1),
        });
        setState(() {
          _likedPosts[videoId] = false;
        });
        HapticFeedback.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Like removed')),
        );
      } else {
        // Add like
        await likeRef.set({
          'user_ref': userRef,
          'video_ref': videoRef,
          'created_at': FieldValue.serverTimestamp(),
        });
        await videoRef.update({
          'LikeCount': FieldValue.increment(1),
        });
        setState(() {
          _likedPosts[videoId] = true;
        });
        HapticFeedback.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Like added')),
        );
      }

      // Refresh just the LikeCount
      final updatedDoc = await videoRef.get();
      setState(() {
        final index = _videos.indexWhere((doc) => doc.reference == videoRef);
        if (index != -1) {
          // Create a new list to trigger rebuild but maintain order
          final newVideos = List<DocumentSnapshot>.from(_videos);
          newVideos[index] = updatedDoc;
          _videos = newVideos;
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating like: $e')),
      );
    }
  }

  Future<void> _checkLikeStatus(String videoId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    final likeRef = FirebaseFirestore.instance
        .collection('likes')
        .doc('${currentUser.uid}_$videoId');

    try {
      final likeDoc = await likeRef.get();
      setState(() {
        _likedPosts[videoId] = likeDoc.exists;
      });
    } catch (e) {
      print('Error checking like status: $e');
    }
  }

  void _toggleGlobalMute() {
    setState(() {
      _isGloballyMuted = !_isGloballyMuted;
      // Update all active controllers
      _controllers.forEach((index, controller) {
        controller?.setVolume(_isGloballyMuted ? 0.0 : 1.0);
      });
    });
  }

  Future<int> _fetchCommentCount(int index) async {
    if (index >= _videos.length) return 0;
    final videoRef =
        _videos[index]['videoIDPassable'] as DocumentReference<Object?>?;
    if (videoRef == null) return 0;

    // Get all comments for this video (both top-level and replies)
    final countQuery = await FirebaseFirestore.instance
        .collection('comments')
        .where('video_ref', isEqualTo: videoRef)
        .count()
        .get();

    return countQuery.count ?? 0;
  }

  void _handleVisibilityChanged(int index, double visibleFraction) {
    if (visibleFraction > 0.7) {
      if (_controllers[index] == null) {
        _initializeController(index);
      }
      _controllers[index]?.play();
      _logVideoStart(index);

      final videoRef = _videos[index]['videoIDPassable'] as DocumentReference?;
      if (videoRef != null) {
        _checkBookmarkStatus(videoRef.id);
        _checkLikeStatus(videoRef.id);
      }
    } else {
      if (_controllers[index]?.value.isInitialized ?? false) {
        try {
          _controllers[index]?.pause();
          _logVideoEnd(index);
        } catch (e) {
          // Handle or log the error if controller was disposed
          print('Error pausing video: $e');
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

    // Commenting out Categories functionality for now
    /*
    final categories = (_videos[index]['Categories'] as List<dynamic>?) ?? ['unknown_category'];
    for (var category in categories) {
      _analytics.logEvent(
        name: 'video_start',
        parameters: {
          'video_id': videoId,
          'user_id': userId,
          'category': category,
        },
      );
    }
    */

    // Simple event logging without categories
    _analytics.logEvent(
      name: 'video_start',
      parameters: {
        'video_id': videoId,
        'user_id': userId,
      },
    );
  }

  void _logVideoEnd(int index) {
    if (_videoStartTime != null) {
      _videoEndTime = DateTime.now();
      final timeSpent = _videoEndTime!.difference(_videoStartTime!).inSeconds;
      final videoRef =
          _videos[index]['videoIDPassable'] as DocumentReference<Object?>?;
      final videoId = videoRef?.id ?? 'unknown_video';
      final userId = currentUserReference ?? 'anonymous_user';

      // Commenting out Categories functionality for now
      /*
      final categories = _videos[index]['Categories'] as List<dynamic>? ?? ['unknown_category'];
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
      }
      */

      // Simple event logging without categories
      _analytics.logEvent(
        name: 'video_end',
        parameters: {
          'video_id': videoId,
          'user_id': userId,
          'time_spent': timeSpent,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _videos.length + 1, // +1 for the stories section
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 0) {
          return StoriesSection();
        }

        final videoIndex = index - 1;
        final videoUrl = _videos[videoIndex]['videoUrl'] as String? ?? '';
        final creatorName =
            _videos[videoIndex]['creatorName'] as String? ?? 'Guest';
        final content = _videos[videoIndex]['content'] as String? ?? '';
        final userPhoto = _videos[videoIndex]['userPhoto'] as String? ?? '';
        final likeCount = _videos[videoIndex]['LikeCount'] as int? ?? 0;
        final shareCount = _videos[videoIndex]['ShareCount'] as int? ?? 0;

        return Container(
          margin: EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: const Color.fromARGB(0, 241, 244, 248),
                width: 0,
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: GestureDetector(
                  onTap: () async {
                    // await HapticFeedback.mediumImpact();

                    final creatorRef =
                        _videos[videoIndex]['creatorID'] as DocumentReference?;

                    if (creatorRef != null) {
                      // Store the full reference in app state
                      FFAppState().update(() {
                        FFAppState().tempCreatorID = creatorRef;
                      });

                      // Navigate to profile
                      await context.pushNamed(
                        'PublicProfileCopy',
                        pathParameters: {
                          'userRef': creatorRef.id,
                        },
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            userPhoto.isNotEmpty
                                ? userPhoto
                                : '/api/placeholder/40/40',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        creatorName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width,
                child: VisibilityDetector(
                  key: Key('video_$videoIndex'),
                  onVisibilityChanged: (info) => _handleVisibilityChanged(
                      videoIndex, info.visibleFraction),
                  child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: Stack(
                        children: [
                          _controllers[videoIndex]?.value.isInitialized ?? false
                              ? VideoPlayer(_controllers[videoIndex]!)
                              : Container(color: Colors.black),
                          if (_controllers[videoIndex]?.value.isInitialized ??
                              false)
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: VideoProgressIndicator(
                                _controllers[videoIndex]!,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                  playedColor:
                                      Color.fromARGB(255, 11, 162, 250),
                                  bufferedColor: Colors.white24,
                                  backgroundColor: Colors.white12,
                                ),
                              ),
                            ),
                          // Add volume control button
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: GestureDetector(
                              onTap: _toggleGlobalMute,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  _isGloballyMuted
                                      ? Icons.volume_off_rounded
                                      : Icons.volume_up_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final videoRef = _videos[videoIndex]['videoIDPassable']
                            as DocumentReference?;
                        if (videoRef != null) {
                          await _toggleLike(videoRef.id, videoRef);
                        }
                      },
                      child: EngagementIcon(
                        iconUrl: _likedPosts[_videos[videoIndex]
                                        ['videoIDPassable']
                                    ?.id] ??
                                false
                            ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/ylgyb05511bg/sidewalk_research-101.png' // Replace with your filled heart icon
                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/9lnm7i2nrmzt/sidewalk_research-99.png', // Your current heart icon
                        count: likeCount,
                      ),
                    ),
                    SizedBox(width: 16),
                    FutureBuilder<int>(
                      future: _fetchCommentCount(videoIndex),
                      builder: (context, snapshot) {
                        return GestureDetector(
                          onTap: () async {
                            final videoRef =
                                _videos[videoIndex]['videoIDPassable'];
                            await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (context) => Container(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                  left: 20,
                                  right: 20,
                                  top: 15,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    Expanded(
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('comments')
                                            .where('video_ref',
                                                isEqualTo: videoRef)
                                            .orderBy('created_date',
                                                descending: true)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return Center(
                                                child: Text(
                                                    'Error: ${snapshot.error}'));
                                          }

                                          if (!snapshot.hasData) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }

                                          final comments =
                                              snapshot.data!.docs.where((doc) {
                                            final data = doc.data()
                                                as Map<String, dynamic>;
                                            return !data.containsKey(
                                                    'parent_comment') ||
                                                data['parent_comment'] == null;
                                          }).toList();

                                          return ListView.builder(
                                            itemCount: comments.length,
                                            itemBuilder: (context, index) {
                                              final comment = comments[index];
                                              final commentData = comment.data()
                                                  as Map<String, dynamic>;

                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    leading: FutureBuilder<
                                                        DocumentSnapshot>(
                                                      future: (commentData[
                                                                  'commenting_user']
                                                              as DocumentReference)
                                                          .get(),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (!snapshot.hasData) {
                                                          return const CircleAvatar();
                                                        }
                                                        final userData =
                                                            snapshot.data!
                                                                    .data()
                                                                as Map<String,
                                                                    dynamic>;
                                                        return GestureDetector(
                                                          onTap: () async {
                                                            final commentingUserRef =
                                                                commentData[
                                                                        'commenting_user']
                                                                    as DocumentReference?;
                                                            if (commentingUserRef !=
                                                                null) {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .tempCreatorID =
                                                                    commentingUserRef;
                                                              });

                                                              if (context
                                                                  .mounted) {
                                                                context
                                                                    .pushNamed(
                                                                  'PublicProfileCopy',
                                                                  pathParameters: {
                                                                    'userRef':
                                                                        commentingUserRef
                                                                            .id,
                                                                  },
                                                                );
                                                              }
                                                            }
                                                          },
                                                          child: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    userData[
                                                                            'photo_url'] ??
                                                                        ''),
                                                            radius: 20,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    title: FutureBuilder<
                                                        DocumentSnapshot>(
                                                      future: (commentData[
                                                                  'commenting_user']
                                                              as DocumentReference)
                                                          .get(),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (!snapshot.hasData) {
                                                          return const Text(
                                                              'Loading...');
                                                        }
                                                        final userData =
                                                            snapshot.data!
                                                                    .data()
                                                                as Map<String,
                                                                    dynamic>;
                                                        return Text(
                                                          userData[
                                                                  'ShopName'] ??
                                                              'User',
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          commentData[
                                                                  'comment'] ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              _formatTimestamp(
                                                                  commentData[
                                                                          'created_date']
                                                                      as Timestamp?),
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            SizedBox(width: 12),
                                                            GestureDetector(
                                                              onTap: () async {
                                                                // Make this async
                                                                // Get the username of the person being replied to
                                                                final replyingToUser =
                                                                    await (commentData['commenting_user']
                                                                            as DocumentReference)
                                                                        .get();
                                                                final replyingToUserData =
                                                                    replyingToUser
                                                                            .data()
                                                                        as Map<
                                                                            String,
                                                                            dynamic>;
                                                                final username =
                                                                    replyingToUserData[
                                                                            'ShopName'] ??
                                                                        'User';

                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  if (mounted) {
                                                                    setState(
                                                                        () {
                                                                      _replyingToComment = _replyingToComment ==
                                                                              comment.reference
                                                                          ? null
                                                                          : comment.reference;
                                                                      _replyController
                                                                              .text =
                                                                          '@$username '; // Add the @ mention
                                                                      _replyingToName =
                                                                          username; // Store the name we're replying to
                                                                    });
                                                                    // Force rebuild of parent widget
                                                                    context
                                                                        .findAncestorStateOfType<
                                                                            _ShiguPlayrState>()
                                                                        ?.setState(
                                                                            () {});
                                                                  }
                                                                });
                                                              },
                                                              child: Text(
                                                                'Reply',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                          .grey[
                                                                      700],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    trailing: const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          10.0), //space between comments
                                                  if (_replyingToComment ==
                                                      comment.reference)
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16,
                                                          vertical: 8),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[100],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              12,
                                                                          top:
                                                                              8,
                                                                          right:
                                                                              40),
                                                                  child: FutureBuilder<
                                                                      DocumentSnapshot>(
                                                                    future: (commentData['commenting_user']
                                                                            as DocumentReference)
                                                                        .get(),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      String
                                                                          username =
                                                                          'User';
                                                                      if (snapshot
                                                                          .hasData) {
                                                                        final userData = snapshot.data!.data() as Map<
                                                                            String,
                                                                            dynamic>;
                                                                        username =
                                                                            userData['ShopName'] ??
                                                                                'User';
                                                                      }
                                                                      return Text(
                                                                        'Replying to ${_replyingToName ?? 'comment'}',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.grey[600],
                                                                          fontSize:
                                                                              13,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          TextField(
                                                                        controller:
                                                                            _replyController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              'Write a reply...',
                                                                          border:
                                                                              InputBorder.none,
                                                                          contentPadding:
                                                                              EdgeInsets.all(12),
                                                                        ),
                                                                        autofocus:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .send,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              Colors.blue),
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              8),
                                                                      constraints:
                                                                          BoxConstraints(),
                                                                      onPressed:
                                                                          () async {
                                                                        if (_replyController
                                                                            .text
                                                                            .trim()
                                                                            .isEmpty)
                                                                          return;
                                                                        final currentUser = FirebaseAuth
                                                                            .instance
                                                                            .currentUser;
                                                                        if (currentUser ==
                                                                            null)
                                                                          return;

                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection('comments')
                                                                            .add({
                                                                          'video_ref':
                                                                              videoRef,
                                                                          'parent_comment':
                                                                              comment.reference,
                                                                          'created_date':
                                                                              FieldValue.serverTimestamp(),
                                                                          'commenting_user': FirebaseFirestore
                                                                              .instance
                                                                              .doc('/users/${currentUser.uid}'),
                                                                          'comment': _replyController
                                                                              .text
                                                                              .trim(),
                                                                          'has_replies':
                                                                              false,
                                                                        });

                                                                        setState(
                                                                            () {
                                                                          _replyController
                                                                              .clear();
                                                                          _replyingToComment =
                                                                              null;
                                                                          _replyingToName =
                                                                              null;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Positioned(
                                                              top: 8,
                                                              right: 8,
                                                              child: IconButton(
                                                                icon: Icon(
                                                                    Icons.close,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: 20),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                constraints:
                                                                    BoxConstraints(),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    _replyingToComment =
                                                                        null;
                                                                    _replyController
                                                                        .clear();
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  StreamBuilder<QuerySnapshot>(
                                                    stream: FirebaseFirestore
                                                        .instance
                                                        .collection('comments')
                                                        .where('parent_comment',
                                                            isEqualTo: comment
                                                                .reference)
                                                        .orderBy('created_date',
                                                            descending: false)
                                                        .snapshots(),
                                                    builder: (context,
                                                        repliesSnapshot) {
                                                      if (!repliesSnapshot
                                                          .hasData)
                                                        return Container();

                                                      final replies =
                                                          repliesSnapshot
                                                              .data!.docs;
                                                      return Column(
                                                        children: replies
                                                            .map((reply) {
                                                          final replyData =
                                                              reply.data()
                                                                  as Map<String,
                                                                      dynamic>;
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 55.0),
                                                            child: ListTile(
                                                              horizontalTitleGap:
                                                                  6.0, // Add this line - controls spacing between avatar and text
                                                              leading:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  final creatorRef =
                                                                      replyData[
                                                                              'commenting_user']
                                                                          as DocumentReference?;
                                                                  if (creatorRef !=
                                                                      null) {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .tempCreatorID =
                                                                          creatorRef;
                                                                    });
                                                                    context
                                                                        .pushNamed(
                                                                      'PublicProfileCopy',
                                                                      pathParameters: {
                                                                        'userRef':
                                                                            creatorRef.id,
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                child: FutureBuilder<
                                                                    DocumentSnapshot>(
                                                                  future: (replyData[
                                                                              'commenting_user']
                                                                          as DocumentReference)
                                                                      .get(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return const CircleAvatar(
                                                                          radius:
                                                                              16);
                                                                    }
                                                                    final userData = snapshot
                                                                            .data!
                                                                            .data()
                                                                        as Map<
                                                                            String,
                                                                            dynamic>;
                                                                    return CircleAvatar(
                                                                      backgroundImage:
                                                                          NetworkImage(userData['photo_url'] ??
                                                                              ''),
                                                                      radius:
                                                                          16,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              title: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        FutureBuilder<
                                                                            DocumentSnapshot>(
                                                                          future:
                                                                              (replyData['commenting_user'] as DocumentReference).get(),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            if (!snapshot.hasData)
                                                                              return const Text('Loading...');
                                                                            final userData =
                                                                                snapshot.data!.data() as Map<String, dynamic>;
                                                                            return Text(
                                                                              userData['ShopName'] ?? 'User',
                                                                              style: const TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 13,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                2),
                                                                        FormattedReplyText(
                                                                          text: replyData['comment'] ??
                                                                              '',
                                                                          fontSize:
                                                                              13,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              subtitle: Row(
                                                                children: [
                                                                  Text(
                                                                    _formatTimestamp(
                                                                        replyData['created_date']
                                                                            as Timestamp?),
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          12),
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      // Get the username of the person being replied to
                                                                      final replyingToUser =
                                                                          await (replyData['commenting_user'] as DocumentReference)
                                                                              .get();
                                                                      final replyingToUserData = replyingToUser
                                                                              .data()
                                                                          as Map<
                                                                              String,
                                                                              dynamic>;
                                                                      final username =
                                                                          replyingToUserData['ShopName'] ??
                                                                              'User';

                                                                      setState(
                                                                          () {
                                                                        _replyingToComment =
                                                                            comment.reference;
                                                                        _replyController.text =
                                                                            '@$username ';
                                                                        _replyingToName =
                                                                            username; // Store the name we're replying to
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                      'Reply',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .grey[700],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      );
                                                    },
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    SafeArea(
                                      child: _replyingToComment == null
                                          ? Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                EmojiSuggestionBar(
                                                  controller:
                                                      _commentController,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextField(
                                                        controller:
                                                            _commentController,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Add a comment...',
                                                          hintStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            borderSide:
                                                                BorderSide.none,
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.grey[200],
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 20,
                                                            vertical: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.blue,
                                                      ),
                                                      child: IconButton(
                                                        icon: const Icon(
                                                            Icons.arrow_upward,
                                                            color:
                                                                Colors.white),
                                                        onPressed: () async {
                                                          if (_commentController
                                                              .text
                                                              .trim()
                                                              .isEmpty) return;
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          final currentUser =
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser;
                                                          if (currentUser ==
                                                              null) return;

                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'comments')
                                                              .add({
                                                            'video_ref':
                                                                videoRef,
                                                            'parent_comment':
                                                                null,
                                                            'created_date':
                                                                FieldValue
                                                                    .serverTimestamp(),
                                                            'commenting_user':
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .doc(
                                                                        '/users/${currentUser.uid}'),
                                                            'comment':
                                                                _commentController
                                                                    .text
                                                                    .trim(),
                                                            'has_replies':
                                                                false,
                                                          });

                                                          _commentController
                                                              .clear();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: EngagementIcon(
                            iconUrl:
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/unu8c4ir3vm1/sidewalk_research-96.png',
                            count: snapshot.data ?? 0,
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 16),
                    EngagementIcon(
                      iconUrl:
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/qy1r9v7f9i2q/sidewalk_research-97.png',
                      count: shareCount,
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () async {
                        final videoRef = _videos[videoIndex]['videoIDPassable']
                            as DocumentReference?;
                        if (videoRef != null) {
                          await _toggleBookmark(videoRef.id, videoRef);
                        }
                      },
                      child: EngagementIcon(
                        iconUrl: _bookmarkedPosts[_videos[videoIndex]
                                        ['videoIDPassable']
                                    ?.id] ??
                                false
                            ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/jz1db1e5gknd/sidewalk_research-98.png'
                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/33fhmd2vft80/sidewalk_research-95.png',
                        count: 0,
                        showCount: false,
                      ),
                    ),
                  ],
                ),
              ),
              if (content.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: '$creatorName ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                              TextSpan(
                                text: content,
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  } // End of build method
} // End of _ShiguPlayrState

// ======== Supporting Widgets ========

class EmojiSuggestionBar extends StatelessWidget {
  final TextEditingController controller;
  static const List<String> emojis = [
    '❤️',
    '🙌',
    '🔥',
    '👏',
    '🥺',
    '😍',
    '😮',
    '😂'
  ];

  const EmojiSuggestionBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey[300]!,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: emojis
            .map(
              (emoji) => GestureDetector(
                onTap: () {
                  final currentText = controller.text;
                  final currentPosition = controller.selection.base.offset;

                  if (currentPosition < 0) {
                    controller.text = currentText + emoji;
                  } else {
                    final newText = currentText.substring(0, currentPosition) +
                        emoji +
                        currentText.substring(currentPosition);
                    controller.text = newText;
                    controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: currentPosition + emoji.length),
                    );
                  }
                },
                child: Text(
                  emoji,
                  style: const TextStyle(
                    fontSize: 27,
                    color: Colors.black, // Ensure full opacity
                    fontFamily: '.SF UI Display', // Use system emoji font
                    height: 1.0, // Tighter line height
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class FormattedReplyText extends StatelessWidget {
  final String text;
  final double fontSize;

  const FormattedReplyText({
    Key? key,
    required this.text,
    this.fontSize = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> textSpans = [];
    final RegExp mentionPattern = RegExp(r'@\S+');

    int lastEnd = 0;

    for (final Match match in mentionPattern.allMatches(text)) {
      if (match.start > lastEnd) {
        textSpans.add(TextSpan(
          text: text.substring(lastEnd, match.start),
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ));
      }

      textSpans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: TextStyle(
          color: Colors.blue[600],
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
      ));

      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      textSpans.add(TextSpan(
        text: text.substring(lastEnd),
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
      ));
    }

    return RichText(
      text: TextSpan(
        children: textSpans,
        style: DefaultTextStyle.of(context).style.copyWith(
              color: Colors.black,
            ),
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
      width: 40,
      height: 40,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
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
    );
  }
}

class EngagementIcon extends StatelessWidget {
  final String iconUrl;
  final int count;
  final bool showCount; // Add this parameter

  const EngagementIcon({
    Key? key,
    required this.iconUrl,
    required this.count,
    this.showCount = true, // Default to showing count
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            iconUrl.isNotEmpty ? iconUrl : 'default_icon_url',
            fit: BoxFit.cover,
          ),
        ),
        if (showCount) ...[
          // Only show count if showCount is true
          SizedBox(width: 4),
          Text(
            valueOrDefault<String>(
              formatNumber(
                count,
                formatType: FormatType.compact,
              ),
              '0',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                  fontSize: 14,
                ),
          ),
        ],
      ],
    );
  }
}

String _formatTimestamp(Timestamp? timestamp) {
  if (timestamp == null) return '';

  final now = DateTime.now();
  final date = timestamp.toDate();
  final difference = now.difference(date);

  // If less than 1 hour, show minutes
  if (difference.inHours < 1) {
    final minutes = difference.inMinutes;
    if (minutes < 1) return 'Just now';
    return '${minutes}m ago';
  }

  // If less than 24 hours, show hours
  if (difference.inHours < 24) {
    final hours = difference.inHours;
    return '${hours}h ago';
  }

  // If more than 24 hours, show the date
  return DateFormat('MMM d, yyyy').format(date);
}
