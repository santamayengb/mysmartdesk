import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authflow_state.dart';

class AuthflowCubit extends Cubit<AuthflowState> {
  AuthflowCubit(FirebaseAuth auth)
      : super(const AuthflowState(status: AuthFlowStatus.initial)) {
    _auth = auth;

    auth.authStateChanges().listen((user) {
      if (user != null) {
        emit(const AuthflowState(status: AuthFlowStatus.loggedIn));
      } else {
        emit(const AuthflowState(status: AuthFlowStatus.loggedOut));
      }
    });
  }

  late final FirebaseAuth _auth;

  Future<void> logout() async {
    _auth.signOut();
  }
}
