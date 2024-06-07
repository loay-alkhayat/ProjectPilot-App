import 'package:equatable/equatable.dart';

class UploadProposalEntity extends Equatable {
  final String status;
  final String message;
  final int pages;

  const UploadProposalEntity(
      {required this.status, required this.message, required this.pages});

  @override
  List<Object?> get props => [status, message, pages];
}
