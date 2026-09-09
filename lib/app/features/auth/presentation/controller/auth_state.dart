class AuthState {}

 class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{
 final String displayName;
 final String photo;
 AuthSuccess(this.displayName,this.photo);
}

class AuthError extends AuthState{
 final String msg;
 AuthError(this.msg);
}
