import '../entities/Restaurant.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> list();
}
