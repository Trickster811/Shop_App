import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:b_shop/utils/utils.dart';

class Article {
  // Global variable to store articles
  static List<DocumentSnapshot> articlesSnapshot = <DocumentSnapshot>[];

  // Global variable to store articles
  static List<DocumentSnapshot> articlesOwnerSnapshot = <DocumentSnapshot>[];

  // Global variable to store house visit statistics
  static List<Map<String, dynamic>> articlesVisitStats =
      <Map<String, dynamic>>[];

  // Global variable to store user chats
  static List<DocumentSnapshot> userChats = <DocumentSnapshot>[];

  // Initialize an instance of firebase cloud firestore
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  // Retreives all articles stored in the database
  static Future<void> getHomes(
    int limit, {
    DocumentSnapshot? startAfter,
    Object? ownerRef,
  }) async {
    Query<Map<String, dynamic>>? refHomes;
    QuerySnapshot? snaparticles;

    if (ownerRef != null) {
      print(ownerRef);
      refHomes = _firebaseFirestore
          .collection('Home')
          .where(
            'ownerReference',
            isEqualTo: ownerRef,
          )
          .orderBy('surfaceHome')
          .limit(limit);
      if (startAfter == null) {
        snaparticles = await refHomes.get();
      } else {
        snaparticles = await refHomes.startAfterDocument(startAfter).get();
      }

      // Adding articles to global instances
      articlesOwnerSnapshot.addAll(snaparticles.docs);
    }
    if (ownerRef == null) {
      refHomes = _firebaseFirestore
          .collection('Home')
          .orderBy('surfaceHome')
          .limit(limit);
      if (startAfter == null) {
        snaparticles = await refHomes.get();
      } else {
        snaparticles = await refHomes.startAfterDocument(startAfter).get();
      }
      // Adding articles to global instances
      articlesSnapshot.addAll(snaparticles.docs);

      articlesVisitStats.clear();
      // Retreiving house visit statistics
      for (dynamic item in articlesSnapshot.isNotEmpty
          ? articlesSnapshot
          : snaparticles.docs) {
        final visitStat = await homeVisitsStatistics(
          houseRef: item.id,
        );
        articlesVisitStats.add({
          item.id: visitStat.data()?['visits'],
        });
      }
    }
  }

  // Retreive house owner informations
  static Future<DocumentSnapshot> getHouseOwnerInformations({
    required DocumentReference ownerRef,
  }) async {
    return await ownerRef.get();
  }

  // Update house informations
  static Future createNewHome({
    required Map<String, dynamic> data,
  }) async {
    return await _firebaseFirestore.collection('Home').doc().set(data);
  }

  // Update house informations
  static Future updateHome({
    required String idHome,
    required Map<Object, Object?> data,
  }) async {
    return await _firebaseFirestore.collection('Home').doc(idHome).update(data);
  }

  // Delete house from database
  static Future deleteHome({
    required String houseRef,
  }) async {
    return await _firebaseFirestore.collection('Home').doc(houseRef).delete();
  }

  // Get house visit statistics
  static Future homeVisitsStatistics({
    required String houseRef,
  }) async {
    return await _firebaseFirestore.collection('Visit').doc(houseRef).get();
  }

  // Get user chats
  static Future getChats(
    DocumentReference userRef,
    String userType,
    int limit, {
    DocumentSnapshot? startAfter,
  }) async {
    final QuerySnapshot chatSnapShot;
    final chatRef = _firebaseFirestore
        .collection('Chat')
        .where(
          userType == 'Owner' ? 'ownerReference' : 'customerReference',
          isEqualTo: userRef,
        )
        .limit(limit);
    if (startAfter == null) {
      chatSnapShot = await chatRef.get();
    } else {
      chatSnapShot = await chatRef.startAfterDocument(startAfter).get();
    }

    userChats.addAll(chatSnapShot.docs);
  }
}

class Category {
  // Global variable to store category
  static List<DocumentSnapshot> categorySnapshot = <DocumentSnapshot>[];

  // Initialize an instance of firebase cloud firestore
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  // Retreives all category stored in the database
  static Future<void> getCategories(
    int limit, {
    DocumentSnapshot? startAfter,
  }) async {
    Query<Map<String, dynamic>>? refCategories;
    QuerySnapshot? snapcategory;

    refCategories =
        _firebaseFirestore.collection('Category').orderBy('name').limit(limit);
    if (startAfter == null) {
      snapcategory = await refCategories.get();
    } else {
      snapcategory = await refCategories.startAfterDocument(startAfter).get();
    }
    // Adding category to global instances
    categorySnapshot.addAll(snapcategory.docs);
  }

  // Update house informations
  static Future createNewCategory({
    required Map<String, dynamic> data,
  }) async {
    return await _firebaseFirestore.collection('Category').doc().set(data);
  }

  // Update house informations
  static Future updateCategory({
    required String idCategory,
    required Map<Object, Object?> data,
  }) async {
    return await _firebaseFirestore
        .collection('Category')
        .doc(idCategory)
        .update(data);
  }

  // Delete house from database
  static Future deleteCategory({
    required String categoryRef,
  }) async {
    return await _firebaseFirestore
        .collection('Category')
        .doc(categoryRef)
        .delete();
  }
}

class Auth {
  static String verifyId = '';
  // Initialize an instance of firebase auth
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //
  static User? get currentUser => _firebaseAuth.currentUser;
  static Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Function for OTP (sms code sent) verification
  static Future verifyOtp({
    required String smsCode,
  }) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: smsCode,
      );
      await currentUser!.updatePhoneNumber(credential);
      return currentUser;
    } on FirebaseAuthException catch (e) {
      UtilFunctions.showFlashMessage(
        e.message!,
        Colors.red,
      );
    } catch (errno) {
      UtilFunctions.showFlashMessage(
        errno.toString(),
        Colors.red,
      );
    }
  }

  // Function for phone authentication
  static Future phoneAuthentication({
    required String phone,
    // required Function next,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await currentUser!.updatePhoneNumber(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        UtilFunctions.showFlashMessage(
          e.message!,
          Colors.red,
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        verifyId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        // Handle auto-retrieval timeout
        verificationId = verificationId;
      },
    );
  }

  // Function to sign in user with email & password
  static Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      UtilFunctions.showFlashMessage(
        e.message!,
        Colors.red,
      );
      // } else {
      //   UtilFunctions.showFlashMessage(
      //     'An error occured\nPlease Make sure you are connected to internet',
      //     Colors.red,
      //   );
      // }
    }
  }

  // Function to sign up user with email & password
  static Future createUserWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await currentUser!.updateDisplayName(userName);
        return currentUser;
      }
    } on FirebaseAuthException catch (e) {
      UtilFunctions.showFlashMessage(
        e.message!,
        Colors.red,
      );
    }
  }

  // Function to sign out user with email & password
  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Function for password reset
  static Future resetPassword({
    required String resetEMail,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: resetEMail,
      );
    } on FirebaseAuthException catch (e) {
      UtilFunctions.showFlashMessage(
        e.message!,
        Colors.red,
      );
    }
  }

  // Function for password reset
  static Future changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: currentUser!.email!,
        password: currentPassword,
      );
      await currentUser!.reauthenticateWithCredential(credential);
      await currentUser!.updatePassword(
        newPassword,
      );
    } on FirebaseAuthException catch (e) {
      UtilFunctions.showFlashMessage(
        e.message!,
        Colors.red,
      );
    }
  }
}

class UserAccount {
  // Initialize an instance of firebase cloud firestore
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  // Cloud saving user's informations
  static Future cloudSaving({
    required Map<String, Object?> data,
  }) async {
    await _firebaseFirestore
        .collection('users')
        .doc(Auth.currentUser!.uid)
        .set(data);

    return localSaving();
  }

  // Local saving user's informations
  static Future<void> localSaving() async {
    final userData = await _firebaseFirestore
        .collection('users')
        .doc(Auth.currentUser!.uid)
        .get();
    await UtilFunctions.setUserInfo(
      {
        'userType': userData['userType'],
        'username': userData['username'],
        'age': userData['age'],
        'town': userData['town'],
        'phone': userData['phone'],
        'email': userData['email'],
        'photoURL': userData['photoURL'],
      },
    );
    await UtilFunctions.setFirstTime(true);
    return;
  }
}
