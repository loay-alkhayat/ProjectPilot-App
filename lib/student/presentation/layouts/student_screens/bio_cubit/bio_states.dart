abstract class BioState {}

class BioInitialState extends BioState {}

class AddBioLoadingState extends BioState {}

class AddBioSuccessState extends BioState {}

class AddBioErrorState extends BioState {
  final String message;
  AddBioErrorState(this.message);
}
