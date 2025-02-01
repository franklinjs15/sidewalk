import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'backup_categories_page_widget.dart' show BackupCategoriesPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BackupCategoriesPageModel
    extends FlutterFlowModel<BackupCategoriesPageWidget> {
  ///  Local state fields for this page.

  List<VideosRecord> videoList = [];
  void addToVideoList(VideosRecord item) => videoList.add(item);
  void removeFromVideoList(VideosRecord item) => videoList.remove(item);
  void removeAtIndexFromVideoList(int index) => videoList.removeAt(index);
  void insertAtIndexInVideoList(int index, VideosRecord item) =>
      videoList.insert(index, item);
  void updateVideoListAtIndex(int index, Function(VideosRecord) updateFn) =>
      videoList[index] = updateFn(videoList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController3;
  int carouselCurrentIndex3 = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
