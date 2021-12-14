part of 'addnewmedicine_cubit.dart';

class AddnewmedicineState extends Equatable {
  const AddnewmedicineState({this.medicName, this.time});

  final String? medicName;
  final String? time;

  @override
  List<Object?> get props => [medicName, time];
}
