import '../entities/FavoriteItem.dart';

abstract class FavoriteItemRepository {
  Future<List<FavoriteItem>> list();
}
