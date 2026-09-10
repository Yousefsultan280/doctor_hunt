import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthGoogleLoading());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> initialize() async {
    await _googleSignIn.initialize(
      serverClientId:
          '91149796050-p7ovj42e70vmh0tsl0ro8hg5nmifhr52.apps.googleusercontent.com',
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      emit(AuthGoogleLoading());
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential=await _auth.signInWithCredential(credential);
      final user =userCredential.user;

      if(user!=null) {
        emit(AuthGoogleSuccess("${user.displayName}", "${user.photoURL}"));
      }else{
        emit(AuthGoogleError("please try again"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthGoogleError("please try again"));
    } catch (e) {
      emit(AuthGoogleError("please try again"));
    }
    return null;
  }

  Future<void> login({File? image,required String email,required String password}) async{
    emit(AuthLogInLoading());
    try{
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      emit(
        AuthLogInSuccess(email: user!.email ??"", name:user.displayName??""),
      );
    } on FirebaseAuthException catch (e) {
      emit(AuthLogInError(msg: e.toString()));
    }

    catch(e){
      emit(AuthLogInError(msg: e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String name,
    required String password,
     File? image,
  }) async {
    emit(AuthSignUpLoading());

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = userCredential.user!;

      await user.updateDisplayName(name);

      String? photoUrl;

      if (image != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('users')
            .child('${user.uid}.jpg');

        await storageRef.putFile(image);

        photoUrl = await storageRef.getDownloadURL();

        await user.updatePhotoURL(photoUrl);
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'uid': user.uid,
        'name': name,
        'email': user.email,
        'photoUrl': photoUrl,
      });

      emit(
        AuthSignSuccess(
          email: user.email ?? "",
          name: name,
          image: photoUrl??"",
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(AuthSignUpError(msg: e.message ?? "Please try again"));
    } catch (e) {
      emit(AuthSignUpError(msg: e.toString()));
    }
  }
  }
