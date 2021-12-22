import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'firebase_auth_state.dart';

class FirebaseAuthCubit extends Cubit<FirebaseAuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuthCubit()
      : super(const FirebaseAuthState(status: UserStatus.initial));

  Future<void> signin(String email, String password) async {
    if (isLoading) {
      return;
    }

    emit(const FirebaseAuthState(status: UserStatus.initial));
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      emit(const FirebaseAuthState(status: UserStatus.loaded));
    } catch (e) {
      emit(const FirebaseAuthState(status: UserStatus.error));
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      emit(const FirebaseAuthState(status: UserStatus.error));
    }
  }

  bool get isLoading => state.status == UserStatus.loading;
}
