const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

// Helper function to convert user_refs string to an array of DocumentReferences
function convertUserRefsToArray(userRefsStr) {
  if (!userRefsStr) return [];

  // Split by comma and map each id to a Firestore DocumentReference in the 'users' collection
  return userRefsStr
    .split(",")
    .map((userId) => admin.firestore().doc(`users/${userId.trim()}`));
}

// Function to create a notification record in 'notifications' collection
async function createNotificationRecord(snapshot, collectionName) {
  const data = snapshot.data();

  // Construct the new document data for 'notifications' collection
  const newNotificationData = {
    ...data, // Copy all fields from the original document
    sourceCollection: collectionName, // Track which collection the document came from
    user_refs: convertUserRefsToArray(data.user_refs), // Convert user_refs to an array of DocumentReferences
  };

  // Insert into the 'notifications' collection
  await admin.firestore().collection("notifications").add(newNotificationData);
}

// Export each function separately

// Trigger for 'ff_push_notifications' collection
exports.onCreateFfPushNotification = functions.firestore
  .document("ff_push_notifications/{docId}")
  .onCreate((snapshot, context) => {
    return createNotificationRecord(snapshot, "ff_push_notifications");
  });

// Trigger for 'ff_user_push_notifications' collection
exports.onCreateFfUserPushNotification = functions.firestore
  .document("ff_user_push_notifications/{docId}")
  .onCreate((snapshot, context) => {
    return createNotificationRecord(snapshot, "ff_user_push_notifications");
  });
