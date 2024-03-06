const admin = require("firebase-admin/app");
admin.initializeApp();

const onUserFollow = require("./on_user_follow.js");
exports.onUserFollow = onUserFollow.onUserFollow;
