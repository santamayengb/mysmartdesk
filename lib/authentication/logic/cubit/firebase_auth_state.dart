part of 'firebase_auth_cubit.dart';

enum UserStatus {
  initial,
  loading,
  loaded,
  error,
}

class FirebaseAuthState extends Equatable {
  const FirebaseAuthState({required this.status, this.email, this.password});

  final String? email;
  final String? password;
  final UserStatus status;

  @override
  List<Object?> get props => [email, password, status];
}
