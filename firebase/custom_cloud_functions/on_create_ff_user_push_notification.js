const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize Firebase Admin SDK
//admin.initializeApp();

// Helper function to convert user_refs string to an array of DocumentReferences
function convertUserRefsToArray(userRefsStr) {
  if (!userRefsStr) return [];

  // Check if it's a single Firestore document path or comma-separated values
  const userRefsArray = userRefsStr.includes(",")
    ? userRefsStr.split(",")
    : [userRefsStr]; // Single value is wrapped in an array

  // Map each entry into a valid Firestore DocumentReference
  return userRefsArray
    .map((ref) => {
      const trimmedRef = ref.trim();

      // Validate the format and return a DocumentReference
      if (trimmedRef.startsWith("users/")) {
        return admin.firestore().doc(trimmedRef); // Use as-is if already a valid path
      }

      console.warn(`Unexpected user_ref format: ${trimmedRef}`);
      return null; // Skip invalid formats
    })
    .filter(Boolean); // Remove null values from the array
}

// Function to create a notification record in 'notifications' collection
async function createNotificationRecord(data, collectionName) {
  try {
    // Construct the new document data for the 'notifications' collection
    const newNotificationData = {
      ...data, // Copy all fields from the original document
      sourceCollection: collectionName, // Identify the source collection
      user_refs: convertUserRefsToArray(data.user_refs), // Convert user_refs string to array
    };

    // Insert into the 'notifications' collection
    await admin
      .firestore()
      .collection("notifications")
      .add(newNotificationData);

    console.log(
      `Notification created for ${collectionName}:`,
      newNotificationData,
    );
  } catch (error) {
    console.error(`Error creating notification for ${collectionName}:`, error);
  }
}

// Trigger for 'ff_user_push_notifications' collection
exports.onCreateFfUserPushNotification = functions.firestore
  .document("ff_user_push_notifications/{docId}")
  .onCreate(async (snapshot, context) => {
    const data = snapshot.data();

    // Pass data and collection name to the helper function
    await createNotificationRecord(data, "ff_user_push_notifications");
  });
