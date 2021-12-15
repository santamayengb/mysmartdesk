import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:firebase_database/firebase_database.dart';

part 'addnewmedicine_state.dart';

class AddnewmedicineCubit extends Cubit<AddnewmedicineState> {
  AddnewmedicineCubit(FirebaseDatabase database)
      : super(const AddnewmedicineState()) {
    database.ref().onValue.listen((value) {
      log(value.snapshot.value.toString());
    });
  }

  final database = FirebaseDatabase.instance.ref();

  Future<void> addNew(String medName, String time) async {
    database.child(medName).push().set(time);
  }
}
