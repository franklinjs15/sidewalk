import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/sidewalk_research-65.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'viewVidUpload': (data) async {
    final allParams = {
      'vidRef': getParameter<DocumentReference>(data, 'vidRef'),
    };
    return ParameterData(
      requiredParams: {
        'vidRef': serializeParam(
          allParams['vidRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'PublicProfile': (data) async {
    final allParams = {
      'userRef': getParameter<DocumentReference>(data, 'userRef'),
    };
    return ParameterData(
      requiredParams: {
        'userRef': serializeParam(
          allParams['userRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'reviewUpload': (data) async => ParameterData(
        allParams: {
          'videoFile': getParameter<String>(data, 'videoFile'),
        },
      ),
  'UserAccount': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'UserMsg': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'IntroPage': ParameterData.none(),
  'NewUser': ParameterData.none(),
  'introz': ParameterData.none(),
  'backup_categories_page': ParameterData.none(),
  'feedback': ParameterData.none(),
  'registerz': ParameterData.none(),
  'privacypolicy': ParameterData.none(),
  'registerzCopy2': ParameterData.none(),
  'ProfileViewVideos': (data) async => ParameterData(
        allParams: {
          'indexToStart': getParameter<int>(data, 'indexToStart'),
        },
      ),
  'editprofile': ParameterData.none(),
  'registerpage1': ParameterData.none(),
  'registerpage2': ParameterData.none(),
  'registerpage3': ParameterData.none(),
  'landingpageweb': ParameterData.none(),
  'deletion': ParameterData.none(),
  'PublicProfileCopy': (data) async {
    final allParams = {
      'userRef': getParameter<DocumentReference>(data, 'userRef'),
    };
    return ParameterData(
      requiredParams: {
        'userRef': serializeParam(
          allParams['userRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'registerpage4': ParameterData.none(),
  'landingpagewebCopy': ParameterData.none(),
  'data': ParameterData.none(),
  'editstats': ParameterData.none(),
  'teampurchase': ParameterData.none(),
  'categorieswithindustries': ParameterData.none(),
  'newcategories_page': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'testhomepage': ParameterData.none(),
  'datamap': ParameterData.none(),
  'Discovery': ParameterData.none(),
  'recordvideo': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
