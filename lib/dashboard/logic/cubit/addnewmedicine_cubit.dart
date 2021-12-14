import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

part 'addnewmedicine_state.dart';

class AddnewmedicineCubit extends Cubit<AddnewmedicineState> {
  AddnewmedicineCubit() : super(const AddnewmedicineState());

  final database = FirebaseDatabase.instance.ref();

  Future<void> addNew(String medName, String time) async {
    database.child(medName).set("sdadsddadasdsdasd");
    database.once().then((value) => log(value.snapshot.value.toString()));
  }
}
