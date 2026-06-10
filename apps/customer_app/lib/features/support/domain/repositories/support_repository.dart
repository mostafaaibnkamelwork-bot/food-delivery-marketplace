import '../entities/SupportTicket.dart';

abstract class SupportTicketRepository {
  Future<List<SupportTicket>> list();
}
