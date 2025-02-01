import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'testhomepage_widget.dart' show TesthomepageWidget;
import 'package:flutter/material.dart';

class TesthomepageModel extends FlutterFlowModel<TesthomepageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
