// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

NotificationStruct _parseNotificationData(
    QueryDocumentSnapshot doc, bool userGenerated) {
  return NotificationStruct(
    content: doc['notification_text'] ?? '',
    userGenerated: userGenerated,
    userId: (doc['sender'] is DocumentReference)
        ? (doc['sender'] as DocumentReference).id
        : '',
    date: (doc['timestamp'] != null && doc['timestamp'] is Timestamp)
        ? (doc['timestamp'] as Timestamp).toDate()
        : DateTime.now(), // Default to DateTime.now() if timestamp is null
    title: doc['notification_title'] ?? '',
  );
}

Future<List<NotificationStruct>> getUserConnectedNotifications(
    String userId) async {
  if (userId == null || userId.isEmpty) {
    print('Error: userId is null or empty');
    return [];
  }

  try {
    List<NotificationStruct> notifications = [];

    // Log userId for debugging
    print('Fetching notifications for userId: $userId');

    // Fetch all documents from ff_push_notifications
    QuerySnapshot pushNotificationsSnapshot = await FirebaseFirestore.instance
        .collection('ff_push_notifications')
        .get();

    for (var doc in pushNotificationsSnapshot.docs) {
      if (doc.exists && doc['user_refs'] != null) {
        // Check if userId is in the user_refs string
        final userRefs = doc['user_refs'] as String;
        if (userRefs.split(',').contains(userId)) {
          notifications.add(_parseNotificationData(doc, false));
        }
      }
    }

    // Fetch all documents from ff_user_push_notifications
    QuerySnapshot userPushNotificationsSnapshot = await FirebaseFirestore
        .instance
        .collection('ff_user_push_notifications')
        .get();

    for (var doc in userPushNotificationsSnapshot.docs) {
      if (doc.exists && doc['user_refs'] != null) {
        // Check if userId is in the user_refs string
        final userRefs = doc['user_refs'] as String;
        if (userRefs.split(',').contains(userId)) {
          notifications.add(_parseNotificationData(doc, true));
        }
      }
    }

    if (notifications.isEmpty) {
      print('No notifications found for userId: $userId');
    } else {
      print('${notifications.length} notifications found for userId: $userId');
    }

    return notifications;
  } catch (e) {
    print('Error fetching user notifications: $e');
    return [];
  }
}
