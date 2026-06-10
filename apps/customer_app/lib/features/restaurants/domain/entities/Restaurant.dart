import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  const Restaurant({required this.id, required this.title});
  final String id;
  final String title;
  @override
  List<Object?> get props => [id, title];
}
