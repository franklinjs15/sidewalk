const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.onUserFollow = functions.firestore
  .document("users/{userId}")
  .onUpdate(async (change, context) => {
    // Get the user ID from the context
    const userId = context.params.userId;

    // Create a reference to the original user
    const originalUserRef = admin.firestore().collection("users").doc(userId);

    const beforeFollowingUsers = change.before.data().following_users || [];
    const afterFollowingUsers = change.after.data().following_users || [];

    // Check if the array increased in size (indicating a new user was added)
    if (afterFollowingUsers.length > beforeFollowingUsers.length) {
      // Get the most recently added user reference
      const newUserRef = afterFollowingUsers[afterFollowingUsers.length - 1];

      // Fetch that user's document
      const userToBeUpdatedDoc = await newUserRef.get();

      // Check if the document exists
      if (!userToBeUpdatedDoc.exists) {
        console.error(`User does not exist at reference ${newUserRef.path}.`);
        return null;
      }

      const usersFollowingMe =
        userToBeUpdatedDoc.data().users_following_me || [];

      // Add the original user's reference to this array
      usersFollowingMe.push(originalUserRef);

      // Update the 'users_following_me' array in Firestore
      return newUserRef.update({
        users_following_me: usersFollowingMe,
      });
    }

    return null;
  });

exports.onUserUnfollow = functions.firestore
  .document("users/{userId}")
  .onUpdate(async (change, context) => {
    // Get the user ID from the context
    const userId = context.params.userId;

    // Create a reference to the original user
    const originalUserRef = admin.firestore().collection("users").doc(userId);

    const beforeFollowingUsers = change.before.data().following_users || [];
    const afterFollowingUsers = change.after.data().following_users || [];

    // Check if the array decreased in size (indicating a user was removed)
    if (afterFollowingUsers.length < beforeFollowingUsers.length) {
      // Find the user reference that was removed
      const removedUserRef = beforeFollowingUsers.find(
        (ref) => !afterFollowingUsers.includes(ref),
      );

      if (!removedUserRef) {
        console.error("Couldn't find the removed user reference.");
        return null;
      }

      // Fetch that user's document
      const userToBeUpdatedDoc = await removedUserRef.get();

      // Check if the document exists
      if (!userToBeUpdatedDoc.exists) {
        console.error(`User does not exist at 
reference ${removedUserRef.path}.`);
        return null;
      }

      return removedUserRef.update({
        users_following_me:
          admin.firestore.FieldValue.arrayRemove(originalUserRef),
      });
    }

    return null;
  });
