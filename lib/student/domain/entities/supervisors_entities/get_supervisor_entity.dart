import 'package:equatable/equatable.dart';

class SupervisorEntity extends Equatable {
  final String status;
  final int pages;
  final SupervisortData data;

  const SupervisorEntity(
      {required this.status, required this.data, required this.pages});

  @override
  List<Object?> get props => [status, data, pages];
}

class SupervisortData extends Equatable {
  final List<Supervisor> supervisor;

  const SupervisortData({required this.supervisor});

  @override
  List<Object?> get props => [supervisor];
}

class Supervisor extends Equatable {
  final String userType;
  final String name;
  final int id;

  Supervisor({
    required this.userType,
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [userType, name, id];
}
