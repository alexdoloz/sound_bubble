import 'dart:typed_data';

import 'package:sound_bubble/logic/app_logic.dart';
import 'package:sound_bubble/models/sign_up_data.dart';
import 'package:sound_bubble/models/sign_in_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseAppLogic extends AppLogic {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;
  FirebaseStorage get _storage => FirebaseStorage.instance;

  Future<void> performNetworking({
    LoadingId loadingId = LoadingId.other,
    required Future<void> Function() networkingClosure,
    required Exception? Function(Exception exception) errorHandler,
  }) async {
    startLoading(loadingId: loadingId);
    try {
      await networkingClosure();
    } on Exception catch (exception) {
      errorHandler(exception);
      // if (newException != null) {
      //   throw newException;
      // }
    } finally {
      stopLoading(loadingId: loadingId);
    }
  }

  @override
  Future<void> signIn(SignInData signInData) async {
    await performNetworking(
      networkingClosure: () async {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInData.login,
          password: signInData.password,
        );
      }, 
      errorHandler: (exception) {
        throw exception;
        // TODO: Маппинг ошибок
      }
    );
  }

  @override
  Future<void> signOut() async {
    await performNetworking(
      networkingClosure: () async => await FirebaseAuth.instance.signOut(), 
      errorHandler: (exception) {
        // TODO: Handle errors
      }
    );
  }

  @override
  Future<void> signUp(SignUpData signUpData) async {
    await performNetworking(
      networkingClosure: () async {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: signUpData.login, 
          password: signUpData.password
        );
        final user = userCredential.user;
        if (user == null) {
          throw Exception("Unknown error");
          // TODO: Handle error
        }
        final uid = user.uid;
        String photoURL = "https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/music-icon-mohammed-jabir-ap.jpg";
        if (signUpData.image != null) {
          final ref = _storage.ref('usersImages/$uid.jpg');
          Uint8List imageBytes = await signUpData.image!.readAsBytes();
          await ref
            .putData(imageBytes, SettableMetadata(contentType: 'image/jpeg'))
            .resume();
          photoURL = await ref.getDownloadURL();
        }

        await _firestore.collection('users')
          .doc(uid)
          .set({
            'uid': uid,
            'displayName': signUpData.name,
            'photoURL': photoURL,
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
      },
      errorHandler: (exception) {
        throw exception;
        // TODO: Маппинг ошибок
      }
    );
  }

  @override
  Future<void> setup() async {
    await Firebase. initializeApp();
    userState.value = UserState.preLogin;
    FirebaseAuth.instance.userChanges().listen((user) async {
      userState.value = user != null ? UserState.postLogin : UserState.preLogin;
    });
  }
}