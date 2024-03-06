import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> extractHashtags(String? text) {
  if (text == null) {
    return [];
  }

  final RegExp hashtagPattern = RegExp(r'\B#\w+\b');
  Iterable<Match> matches = hashtagPattern.allMatches(text);

  List<String> hashtags =
      matches.map((match) => match.group(0)).whereType<String>().toList();

  return hashtags;
}

List<String> extractMentions(String? mention) {
  final RegExp mentionRegex = RegExp(r'@\w+(_\w+)*');
  final Iterable<RegExpMatch> matches = mentionRegex.allMatches(mention!);

  return matches.map((match) => match.group(0)!).toList();
}
