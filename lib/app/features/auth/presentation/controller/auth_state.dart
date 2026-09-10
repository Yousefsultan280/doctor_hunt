import 'dart:io';

class AuthState {}

// google states
 class AuthGoogleLoading extends AuthState{}

class AuthGoogleSuccess extends AuthState{
 final String displayName;
 final String photo;
 AuthGoogleSuccess(this.displayName,this.photo);
}

class AuthGoogleError extends AuthState{
 final String msg;
 AuthGoogleError(this.msg);
}



// signup states

class AuthSignUpLoading extends AuthState{}

class AuthSignSuccess extends AuthState{
 final String email;
 final String name;
 final String? image;
 AuthSignSuccess({required this.email,required this.name,this.image});
}

class AuthSignUpError extends AuthState{
 final String msg;
 AuthSignUpError({required this.msg});
}




// Login states
class AuthLogInLoading extends AuthState{}

class AuthLogInSuccess extends AuthState{
 final String email;
 final String name;

 AuthLogInSuccess({required this.email,required this.name});
}

class AuthLogInError extends AuthState{
 final String msg;
 AuthLogInError({required this.msg});
}

