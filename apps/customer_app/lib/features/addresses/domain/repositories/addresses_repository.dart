import '../entities/Address.dart';

abstract class AddressRepository {
  Future<List<Address>> list();
}
