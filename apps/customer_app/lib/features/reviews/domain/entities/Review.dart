import 'package:equatable/equatable.dart';

class Review extends Equatable {
  const Review({required this.id, required this.title});
  final String id;
  final String title;
  @override
  List<Object?> get props => [id, title];
}
