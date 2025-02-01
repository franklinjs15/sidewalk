import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'user_account_widget.dart' show UserAccountWidget;
import 'package:flutter/material.dart';

class UserAccountModel extends FlutterFlowModel<UserAccountWidget> {
  ///  Local state fields for this page.

  int? activePageView = 0;

  bool uploadSelectVis = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

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
