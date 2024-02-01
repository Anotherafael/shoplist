import 'package:dartz/dartz.dart';
import 'package:shoplist/app/domain/core/error/failures.dart';

import '../entities/shop_item_entity.dart';

abstract class IShopItemRepository {
  Future<Either<Failure, Unit>> add(ShopItemEntity item);
  Future<Either<Failure, List<ShopItemEntity>>> fetch();
}
