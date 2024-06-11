import 'package:equatable/equatable.dart';

class EngineerEntity extends Equatable {
  final String status;
  final String pages;
  final EngineerData data;

  const EngineerEntity(
      {required this.status, required this.data, required this.pages});

  @override
  List<Object?> get props => [status, data, pages];
}

class EngineerData extends Equatable {
  final List<Engineer> engineer;

  const EngineerData({required this.engineer});

  @override
  List<Object?> get props => [engineer];
}

class Engineer extends Equatable {
  final String userType;
  final String name;
  final int id;

  Engineer({
    required this.userType,
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [userType, name, id];
}
