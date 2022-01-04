import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shifftie/Constants/collections.dart';
import 'package:shifftie/Constants/constants.dart';
import 'package:shifftie/DatabaseMethods/local_database.dart';
import 'package:shifftie/DatabaseMethods/user_api.dart';
import 'package:shifftie/Models/users.dart';
import 'package:shifftie/utilities/custom_toast.dart';

class AuthMethod {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<bool> loginAnonymosly() async {
    try {
      await _auth.signInAnonymously();
      String date = DateTime.now().toString();
      DateTime dateparse = DateTime.parse(date);
      String formattedDate =
          '${dateparse.day}-${dateparse.month}-${dateparse.year}';
      final AppUserModel appUser = AppUserModel(
        id: DateTime.now().microsecond.toString(),
        name: 'Guest User',
        email: 'guest@guest.com',
        imageUrl: '',
        androidNotificationToken: '',
        createdAt: Timestamp.now(),
        joinedAt: formattedDate,
        password: '',
        isAdmin: false,
      );
      LocalDB().storeAppUserData(appUser: appUser);
      return true;
    } catch (error) {
      CustomToast.errorToast(message: error.toString());
    }
    return false;
  }

  Future<bool> signinWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      print('here');
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          String date = DateTime.now().toString();
          DateTime dateparse = DateTime.parse(date);
          String formattedDate =
              '${dateparse.day}-${dateparse.month}-${dateparse.year}';
          final UserCredential authResult = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          DocumentSnapshot doc = await userRef.doc(authResult.user!.uid).get();
          print(doc.exists);
          if (doc.exists) {
            currentUser = AppUserModel.fromDocument(doc);
            // final bool _isOkay = await UserAPI().addUser(currentUser!);

            return true;
          } else {
            final AppUserModel _appUser = AppUserModel(
              id: authResult.user!.uid,
              name: authResult.user!.displayName,
              email: authResult.user!.email,
              imageUrl: authResult.user!.photoURL,
              phoneNo: "",
              androidNotificationToken: "",
              password: "",
              joinedAt: formattedDate,
              isAdmin: false,
              createdAt: Timestamp.now(),
            );
            final bool _isOkay = await UserAPI().addUser(_appUser);
            if (_isOkay) {
              currentUser = _appUser;

              LocalDB().storeAppUserData(appUser: _appUser);
            } else {
              return false;
            }
          }
          return true;
        } catch (error) {
          CustomToast.errorToast(message: error.toString());
        }
      }
    }
    return false;
  }

  Future<User?> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth
          .createUserWithEmailAndPassword(
        email: email.toLowerCase().trim(),
        password: password.trim(),
      )
          .catchError((Object obj) {
        CustomToast.errorToast(message: obj.toString());
      });
      final User? user = result.user;
      assert(user != null);
      return user;
    } catch (signUpError) {
      CustomToast.errorToast(message: signUpError.toString());
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .catchError((Object obj) {
        CustomToast.errorToast(message: obj.toString());
      });
      final User? user = result.user;
      final DocumentSnapshot<Map<String, dynamic>> docs =
          await UserAPI().getInfo(uid: user!.uid);
      final AppUserModel appUser = AppUserModel.fromDocument(docs);
      currentUser = appUser;
      LocalDB().storeAppUserData(appUser: appUser);
      return user;
    } catch (signUpError) {
      CustomToast.errorToast(message: signUpError.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    LocalDB().signout();
    await _auth.signOut();
  }
}
