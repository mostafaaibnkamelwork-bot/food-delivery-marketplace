import '../entities/Coupon.dart';

abstract class CouponRepository {
  Future<List<Coupon>> list();
}
