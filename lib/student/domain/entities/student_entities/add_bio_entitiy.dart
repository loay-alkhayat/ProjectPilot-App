import 'package:equatable/equatable.dart';

class BioEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final BiotData data;

  const BioEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, message, data, pages];
}

class BiotData extends Equatable {
  final Bio user;

  const BiotData({required this.user});

  @override
  List<Object?> get props => [user];
}

class Bio extends Equatable {
  final String userType;
  final String name;
  final String universityIdNumber;
  final String bio;
  final String major;
  final int junior;

  Bio(
      {required this.userType,
      required this.name,
      required this.universityIdNumber,
      required this.bio,
      required this.major,
      required this.junior});

  @override
  List<Object?> get props =>
      [userType, name, universityIdNumber, bio, major, junior];
}
