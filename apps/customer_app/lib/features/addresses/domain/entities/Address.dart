import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({required this.id, required this.title});
  final String id;
  final String title;
  @override
  List<Object?> get props => [id, title];
}
