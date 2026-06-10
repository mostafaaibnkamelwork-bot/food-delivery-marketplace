import '../entities/Review.dart';

abstract class ReviewRepository {
  Future<List<Review>> list();
}
