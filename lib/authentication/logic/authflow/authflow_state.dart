part of 'authflow_cubit.dart';

enum AuthFlowStatus { initial, loggedIn, loggedOut, signup }

class AuthflowState extends Equatable {
  const AuthflowState({required this.status});
  final AuthFlowStatus status;

  @override
  List<Object?> get props => [status];
}
