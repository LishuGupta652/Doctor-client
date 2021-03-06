import 'package:doctor_client/models/user.dart';
import 'package:doctor_client/utils/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final Firestore firestore = Firestore.instance;

  //user class
  User user = User();

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication =
        await _signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: _signInAuthentication.idToken,
        accessToken: _signInAuthentication.accessToken);

    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    QuerySnapshot result = await firestore
        .collection('users')
        .where("email", isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;

    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(FirebaseUser currentUser) async {
    String username = Utils.getUserName(currentUser.email);

    user = User(
        uid: currentUser.uid,
        email: currentUser.email,
        name: currentUser.displayName,
        profilePhoto: currentUser.photoUrl,
        username: username);

    firestore
        .collection('users')
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect().whenComplete(() async {
      await _auth.signOut();
    });
    return await _auth.signOut();
  }

  Future<FirebaseUser> createUserWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  Future<void> addDataFromEmailRegistration(FirebaseUser currentUser) async {
    String username = Utils.getUserName(currentUser.email);

    user = User(
        uid: currentUser.uid,
        email: currentUser.email,
        name: currentUser.displayName,
        profilePhoto: currentUser.photoUrl,
        username: username);

    firestore
        .collection('users')
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }
}
