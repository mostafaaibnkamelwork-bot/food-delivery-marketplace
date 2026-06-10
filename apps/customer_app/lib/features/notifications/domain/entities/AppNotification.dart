import 'package:equatable/equatable.dart';

class AppNotification extends Equatable {
  const AppNotification({required this.id, required this.title});
  final String id;
  final String title;
  @override
  List<Object?> get props => [id, title];
}
