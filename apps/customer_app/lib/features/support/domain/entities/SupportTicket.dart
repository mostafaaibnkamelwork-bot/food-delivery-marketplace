import 'package:equatable/equatable.dart';

class SupportTicket extends Equatable {
  const SupportTicket({required this.id, required this.title});
  final String id;
  final String title;
  @override
  List<Object?> get props => [id, title];
}
