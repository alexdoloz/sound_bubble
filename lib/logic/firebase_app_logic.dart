import 'package:sound_bubble/logic/app_logic.dart';
import 'package:sound_bubble/models/sign_up_data.dart';
import 'package:sound_bubble/models/sign_in_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAppLogic extends AppLogic {
  get _auth => FirebaseAuth.instance;
  get _firestore => FirebaseFirestore.instance;

  @override
  Future<void> signIn(SignInData signInData) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: signInData.login,
      password: signInData.password,
    );
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signUp(SignUpData signUpData) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: signUpData.login, 
      password: signUpData.password
    );
    final user = userCredential.user;
    if (user == null) {
      // TODO: Handle error
      return;
    }
    final uid = user.uid;
    await _firestore.collection('users')
      .doc(uid)
      .set({
        'uid': uid,
        'displayName': signUpData.name,
        'photoURL': "https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/music-icon-mohammed-jabir-ap.jpg", // TODO: Исправить логику
        'isAuthor': signUpData.isArtist,
        'isVerified': signUpData.isArtist, // TODO: Уточнить
        'numberOfListenersPerMonth': 0,
        'ownSongs': [],
        'ownPlaylists': [],
        'addedSongs': [],
        'addedPlaylists': [],
        'addedAuthors': [],
        'lastSongPlayed': "",
        'chats': [],
        'friends': [],
        'subscribers': 0,
        'regDate': DateTime.now(),
        'imageColors': List.generate(6, (_) => '#e6671e'), // TODO: Использовать palette_generator
      });
    await _firestore
      .collection('search')
      .doc(uid)
      .set({
        'place': 'users',
        'uid': uid,
        'rank': 0,
        // TODO: variantsOfName
      });

    await _firestore
      .collection('searchHistory')
      .doc(uid)
      .set({
        'history': [],
      });

    await _firestore
      .collection('history')
      .doc(uid)
      .set({
        'history': [],
      });
  }

  @override
  Future<void> setup() async {
    await Firebase.initializeApp();
    userState.value = UserState.preLogin;
    FirebaseAuth.instance.userChanges().listen((user) async {
      userState.value = user != null ? UserState.postLogin : UserState.preLogin;
    });
  }
}