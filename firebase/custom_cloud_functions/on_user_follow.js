const functions = require("firebase-functions");
const admin = require("firebase-admin");

//admin.initializeApp();

// Firestore reference
const db = admin.firestore();

// Function to handle following a user
exports.onUserFollow = functions.firestore
  .document("users/{userId}")
  .onUpdate(async (change, context) => {
    const userId = context.params.userId;
    const originalUserRef = db.collection("users").doc(userId);

    const beforeFollowingUsers = change.before.data().following_users || [];
    const afterFollowingUsers = change.after.data().following_users || [];

    if (afterFollowingUsers.length > beforeFollowingUsers.length) {
      // Find the newly added user reference
      const newUserRef = afterFollowingUsers.find(
        (ref) => !beforeFollowingUsers.includes(ref),
      );

      if (!newUserRef) {
        console.error("Could not identify the newly followed user.");
        return null;
      }

      try {
        await db.runTransaction(async (transaction) => {
          const userToBeUpdatedDoc = await transaction.get(newUserRef);

          if (!userToBeUpdatedDoc.exists) {
            console.error(
              `User does not exist at reference ${newUserRef.path}.`,
            );
            return;
          }

          const usersFollowingMe =
            userToBeUpdatedDoc.data().users_following_me || [];
          usersFollowingMe.push(originalUserRef);

          transaction.update(newUserRef, {
            users_following_me: usersFollowingMe,
          });
        });
      } catch (error) {
        console.error("Error updating users_following_me:", error);
      }
    }

    return null;
  });

// Function to handle unfollowing a user
exports.onUserUnfollow = functions.firestore
  .document("users/{userId}")
  .onUpdate(async (change, context) => {
    const userId = context.params.userId;
    const originalUserRef = db.collection("users").doc(userId);

    const beforeFollowingUsers = change.before.data().following_users || [];
    const afterFollowingUsers = change.after.data().following_users || [];

    if (afterFollowingUsers.length < beforeFollowingUsers.length) {
      // Find the removed user reference
      const removedUserRef = beforeFollowingUsers.find(
        (ref) => !afterFollowingUsers.includes(ref),
      );

      if (!removedUserRef) {
        console.error("Could not identify the unfollowed user.");
        return null;
      }

      try {
        await db.runTransaction(async (transaction) => {
          const userToBeUpdatedDoc = await transaction.get(removedUserRef);

          if (!userToBeUpdatedDoc.exists) {
            console.error(
              `User does not exist at reference ${removedUserRef.path}.`,
            );
            return;
          }

          transaction.update(removedUserRef, {
            users_following_me:
              admin.firestore.FieldValue.arrayRemove(originalUserRef),
          });
        });
      } catch (error) {
        console.error("Error updating users_following_me:", error);
      }
    }

    return null;
  });
