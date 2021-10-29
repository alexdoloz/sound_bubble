import 'package:sound_bubble/logic/app_logic.dart';
import 'package:sound_bubble/models/sign_up_data.dart';
import 'package:sound_bubble/models/sign_in_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAppLogic extends AppLogic {
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
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signUpData.login, 
      password: signUpData.password
    );
  }

  @override
  Future<void> setup() async {
    await Firebase.initializeApp();
    userState.value = UserState.preLogin;
    FirebaseAuth.instance.userChanges().listen((user) async {
      userState.value = user != null ? UserState.postLogin : UserState.preLogin;
      final songs = await FirebaseFirestore.instance.collection("/songs/000a263e-24cd-4480-b3fb-3078e79dfee4/").get();
      print(songs.docs.first.data().entries.join(";"));
    });
  }
}