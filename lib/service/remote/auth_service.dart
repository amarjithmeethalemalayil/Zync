import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';
import 'package:zynk/core/error/failures.dart';
import 'package:zynk/model/user_model.dart';

class AuthService {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final GoogleSignIn gSignIn;

  AuthService({
    required this.auth,
    required this.db,
    required this.gSignIn,
  });

  Future<Either<Failures, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user == null) {
        return Left(Failures(message: "User registration failed"));
      }

      final uid = user.uid;
      final newUser = UserModel(
        name: name,
        email: email,
        uid: uid,
        followers: [],
        following: [],
        uploadedVideos: [],
      );
      await db
          .collection(LocalRemoteHelper.collectionName)
          .doc(uid)
          .set(newUser.toJson());
      return Right(newUser);
    } on FirebaseAuthException catch (e) {
      return Left(
        Failures(message: e.message ?? "FirebaseAuthException occurred"),
      );
    } catch (e) {
      return Left(Failures(message: "Unexpected error: ${e.toString()}"));
    }
  }
  Future<Either<Failures, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        return Left(Failures(message: "User authentication failed"));
      }

      final uid = user.uid;
      final userDoc =
          await db.collection(LocalRemoteHelper.collectionName).doc(uid).get();

      if (userDoc.exists && userDoc.data() != null) {
        final loggedInUser = UserModel.fromJson(userDoc.data()!);
        return Right(loggedInUser);
      } else {
        return Left(Failures(message: "User data not found in Firestore"));
      }
    } on FirebaseAuthException catch (e) {
      return Left(
        Failures(message: e.message ?? "FirebaseAuthException occurred"),
      );
    } catch (e) {
      return Left(Failures(message: "Unexpected error: ${e.toString()}"));
    }
  }

  Future<Either<Failures, UserModel>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await gSignIn.signIn();
      if (googleUser == null) {
        return Left(Failures(message: "Google Sign-In canceled"));
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user == null) {
        return Left(Failures(message: "Google Sign-In failed"));
      }
      final uid = user.uid;
      final userDoc =
          await db.collection(LocalRemoteHelper.collectionName).doc(uid).get();

      UserModel userModel;
      if (userDoc.exists && userDoc.data() != null) {
        userModel = UserModel.fromJson(userDoc.data()!);
      } else {
        userModel = UserModel(
          name: user.displayName ?? "User",
          email: user.email!,
          uid: uid,
          followers: [],
          following: [],
          uploadedVideos: [],
        );
        await db.collection(LocalRemoteHelper.collectionName).doc(uid).set(
              userModel.toJson(),
            );
      }
      return Right(userModel);
    } catch (e) {
      return Left(Failures(message: "Google Sign-In error: ${e.toString()}"));
    }
  }

  Future<Either<Failures, String>> forgotPassword(
      {required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return Right("Password reset email sent successfully");
    } catch (e) {
      return Left(Failures(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
