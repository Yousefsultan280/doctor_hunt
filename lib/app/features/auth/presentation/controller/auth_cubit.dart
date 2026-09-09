import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoading());

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
      emit(AuthLoading());
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential=await _auth.signInWithCredential(credential);
      final user =userCredential.user;

      if(user!=null) {
        emit(AuthSuccess("${user.displayName}", "${user.photoURL}"));
      }else{
        emit(AuthError("please try again"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError("please try again"));
    } catch (e) {
      emit(AuthError("please try again"));
    }
    return null;
  }

}
