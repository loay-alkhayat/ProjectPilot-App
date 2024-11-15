import 'package:equatable/equatable.dart';

class MapPointEntity extends Equatable{
  final double latitude;
  final double longitude;

  const MapPointEntity({required this.latitude,required this.longitude});

  @override
  List<Object> get props => [latitude,longitude];
}