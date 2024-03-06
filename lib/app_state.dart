import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _autoFillEmail = prefs.getString('ff_autoFillEmail') ?? _autoFillEmail;
    });
    _safeInit(() {
      _LikedVideos = prefs
              .getStringList('ff_LikedVideos')
              ?.map((path) => path.ref)
              .toList() ??
          _LikedVideos;
    });
    _safeInit(() {
      _profileVisitors = prefs
              .getStringList('ff_profileVisitors')
              ?.map((path) => path.ref)
              .toList() ??
          _profileVisitors;
    });
    _safeInit(() {
      _watchHistory = prefs
              .getStringList('ff_watchHistory')
              ?.map((path) => path.ref)
              .toList() ??
          _watchHistory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _replyToName = '';
  String get replyToName => _replyToName;
  set replyToName(String value) {
    _replyToName = value;
  }

  DocumentReference? _tempVidID;
  DocumentReference? get tempVidID => _tempVidID;
  set tempVidID(DocumentReference? value) {
    _tempVidID = value;
  }

  DocumentReference? _tempCreatorID;
  DocumentReference? get tempCreatorID => _tempCreatorID;
  set tempCreatorID(DocumentReference? value) {
    _tempCreatorID = value;
  }

  bool _postIsPrivateTemp = false;
  bool get postIsPrivateTemp => _postIsPrivateTemp;
  set postIsPrivateTemp(bool value) {
    _postIsPrivateTemp = value;
  }

  bool _postIs18Older = false;
  bool get postIs18Older => _postIs18Older;
  set postIs18Older(bool value) {
    _postIs18Older = value;
  }

  String _postInputText = '';
  String get postInputText => _postInputText;
  set postInputText(String value) {
    _postInputText = value;
  }

  String _recordingPath = '';
  String get recordingPath => _recordingPath;
  set recordingPath(String value) {
    _recordingPath = value;
  }

  bool _recordingHasStopped = false;
  bool get recordingHasStopped => _recordingHasStopped;
  set recordingHasStopped(bool value) {
    _recordingHasStopped = value;
  }

  bool _pickedFileTooLong = false;
  bool get pickedFileTooLong => _pickedFileTooLong;
  set pickedFileTooLong(bool value) {
    _pickedFileTooLong = value;
  }

  bool _isMuted = false;
  bool get isMuted => _isMuted;
  set isMuted(bool value) {
    _isMuted = value;
  }

  bool _uploadInProgress = false;
  bool get uploadInProgress => _uploadInProgress;
  set uploadInProgress(bool value) {
    _uploadInProgress = value;
  }

  String _postText = '';
  String get postText => _postText;
  set postText(String value) {
    _postText = value;
  }

  bool _compressStart = false;
  bool get compressStart => _compressStart;
  set compressStart(bool value) {
    _compressStart = value;
  }

  String _returnedThumbnailName = '';
  String get returnedThumbnailName => _returnedThumbnailName;
  set returnedThumbnailName(String value) {
    _returnedThumbnailName = value;
  }

  String _videoUrl = '';
  String get videoUrl => _videoUrl;
  set videoUrl(String value) {
    _videoUrl = value;
  }

  String _returnedFileName = '';
  String get returnedFileName => _returnedFileName;
  set returnedFileName(String value) {
    _returnedFileName = value;
  }

  String _vidFilePath = '';
  String get vidFilePath => _vidFilePath;
  set vidFilePath(String value) {
    _vidFilePath = value;
  }

  List<String> _PostHashtags = [];
  List<String> get PostHashtags => _PostHashtags;
  set PostHashtags(List<String> value) {
    _PostHashtags = value;
  }

  void addToPostHashtags(String value) {
    _PostHashtags.add(value);
  }

  void removeFromPostHashtags(String value) {
    _PostHashtags.remove(value);
  }

  void removeAtIndexFromPostHashtags(int index) {
    _PostHashtags.removeAt(index);
  }

  void updatePostHashtagsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _PostHashtags[index] = updateFn(_PostHashtags[index]);
  }

  void insertAtIndexInPostHashtags(int index, String value) {
    _PostHashtags.insert(index, value);
  }

  String _autoFillEmail = '';
  String get autoFillEmail => _autoFillEmail;
  set autoFillEmail(String value) {
    _autoFillEmail = value;
    prefs.setString('ff_autoFillEmail', value);
  }

  List<DocumentReference> _LikedVideos = [];
  List<DocumentReference> get LikedVideos => _LikedVideos;
  set LikedVideos(List<DocumentReference> value) {
    _LikedVideos = value;
    prefs.setStringList('ff_LikedVideos', value.map((x) => x.path).toList());
  }

  void addToLikedVideos(DocumentReference value) {
    _LikedVideos.add(value);
    prefs.setStringList(
        'ff_LikedVideos', _LikedVideos.map((x) => x.path).toList());
  }

  void removeFromLikedVideos(DocumentReference value) {
    _LikedVideos.remove(value);
    prefs.setStringList(
        'ff_LikedVideos', _LikedVideos.map((x) => x.path).toList());
  }

  void removeAtIndexFromLikedVideos(int index) {
    _LikedVideos.removeAt(index);
    prefs.setStringList(
        'ff_LikedVideos', _LikedVideos.map((x) => x.path).toList());
  }

  void updateLikedVideosAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _LikedVideos[index] = updateFn(_LikedVideos[index]);
    prefs.setStringList(
        'ff_LikedVideos', _LikedVideos.map((x) => x.path).toList());
  }

  void insertAtIndexInLikedVideos(int index, DocumentReference value) {
    _LikedVideos.insert(index, value);
    prefs.setStringList(
        'ff_LikedVideos', _LikedVideos.map((x) => x.path).toList());
  }

  List<DocumentReference> _profileVisitors = [];
  List<DocumentReference> get profileVisitors => _profileVisitors;
  set profileVisitors(List<DocumentReference> value) {
    _profileVisitors = value;
    prefs.setStringList(
        'ff_profileVisitors', value.map((x) => x.path).toList());
  }

  void addToProfileVisitors(DocumentReference value) {
    _profileVisitors.add(value);
    prefs.setStringList(
        'ff_profileVisitors', _profileVisitors.map((x) => x.path).toList());
  }

  void removeFromProfileVisitors(DocumentReference value) {
    _profileVisitors.remove(value);
    prefs.setStringList(
        'ff_profileVisitors', _profileVisitors.map((x) => x.path).toList());
  }

  void removeAtIndexFromProfileVisitors(int index) {
    _profileVisitors.removeAt(index);
    prefs.setStringList(
        'ff_profileVisitors', _profileVisitors.map((x) => x.path).toList());
  }

  void updateProfileVisitorsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _profileVisitors[index] = updateFn(_profileVisitors[index]);
    prefs.setStringList(
        'ff_profileVisitors', _profileVisitors.map((x) => x.path).toList());
  }

  void insertAtIndexInProfileVisitors(int index, DocumentReference value) {
    _profileVisitors.insert(index, value);
    prefs.setStringList(
        'ff_profileVisitors', _profileVisitors.map((x) => x.path).toList());
  }

  List<DocumentReference> _watchHistory = [];
  List<DocumentReference> get watchHistory => _watchHistory;
  set watchHistory(List<DocumentReference> value) {
    _watchHistory = value;
    prefs.setStringList('ff_watchHistory', value.map((x) => x.path).toList());
  }

  void addToWatchHistory(DocumentReference value) {
    _watchHistory.add(value);
    prefs.setStringList(
        'ff_watchHistory', _watchHistory.map((x) => x.path).toList());
  }

  void removeFromWatchHistory(DocumentReference value) {
    _watchHistory.remove(value);
    prefs.setStringList(
        'ff_watchHistory', _watchHistory.map((x) => x.path).toList());
  }

  void removeAtIndexFromWatchHistory(int index) {
    _watchHistory.removeAt(index);
    prefs.setStringList(
        'ff_watchHistory', _watchHistory.map((x) => x.path).toList());
  }

  void updateWatchHistoryAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _watchHistory[index] = updateFn(_watchHistory[index]);
    prefs.setStringList(
        'ff_watchHistory', _watchHistory.map((x) => x.path).toList());
  }

  void insertAtIndexInWatchHistory(int index, DocumentReference value) {
    _watchHistory.insert(index, value);
    prefs.setStringList(
        'ff_watchHistory', _watchHistory.map((x) => x.path).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
