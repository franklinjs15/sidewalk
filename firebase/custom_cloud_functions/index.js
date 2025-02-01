const admin = require("firebase-admin/app");
admin.initializeApp();

const onUserFollow = require("./on_user_follow.js");
exports.onUserFollow = onUserFollow.onUserFollow;
const onCreateFfUserPushNotification = require("./on_create_ff_user_push_notification.js");
exports.onCreateFfUserPushNotification =
  onCreateFfUserPushNotification.onCreateFfUserPushNotification;
const onCreateFfPushNotification = require("./on_create_ff_push_notification.js");
exports.onCreateFfPushNotification =
  onCreateFfPushNotification.onCreateFfPushNotification;
