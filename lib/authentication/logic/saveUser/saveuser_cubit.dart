import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'saveuser_state.dart';

class SaveuserCubit extends Cubit<SaveuserState> {
  SaveuserCubit() : super(const SaveuserState());

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> saveUser(Map<String, dynamic> user) async {
    firebaseFirestore.collection("user").add(user);
  }

  Future<void> deleteUser() async {}
}
