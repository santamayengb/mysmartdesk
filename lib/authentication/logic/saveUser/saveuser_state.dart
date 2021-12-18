part of 'saveuser_cubit.dart';

class SaveuserState extends Equatable {
  const SaveuserState({this.userName, this.pwd, this.isAdmin});

  final String? userName;
  final String? pwd;
  final bool? isAdmin;

  @override
  List<Object?> get props => [userName, pwd, isAdmin];
}
