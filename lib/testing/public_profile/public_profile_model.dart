import '/flutter_flow/flutter_flow_util.dart';
import 'public_profile_widget.dart' show PublicProfileWidget;
import 'package:flutter/material.dart';

class PublicProfileModel extends FlutterFlowModel<PublicProfileWidget> {
  ///  Local state fields for this page.

  int? activePageView = 0;

  bool uploadSelectVis = false;

  List<String> videoUrls = [];
  void addToVideoUrls(String item) => videoUrls.add(item);
  void removeFromVideoUrls(String item) => videoUrls.remove(item);
  void removeAtIndexFromVideoUrls(int index) => videoUrls.removeAt(index);
  void insertAtIndexInVideoUrls(int index, String item) =>
      videoUrls.insert(index, item);
  void updateVideoUrlsAtIndex(int index, Function(String) updateFn) =>
      videoUrls[index] = updateFn(videoUrls[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
