import 'package:equatable/equatable.dart';

class GetProposalsEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final GetProposalsData data;

  const GetProposalsEntity(
      {required this.status,
      required this.data,
      required this.pages,
      required this.message});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetProposalsData extends Equatable {
  final List<GetProposals> proposals;

  const GetProposalsData({required this.proposals});

  @override
  List<Object?> get props => [proposals];
}

class GetProposals extends Equatable {
  final String description;
  final String name;
  final String filePath;

  GetProposals({
    required this.description,
    required this.name,
    required this.filePath,
  });

  @override
  List<Object?> get props => [filePath, name, description];
}
