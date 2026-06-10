import '../entities/OrderSummary.dart';

abstract class OrderSummaryRepository {
  Future<List<OrderSummary>> list();
}
