import 'package:dartz/dartz.dart';
import 'package:shoplist/app/infra/datasources/add_shop_item_source.dart';

import '../../domain/core/error/failures.dart';
import '../../domain/entities/shop_item_entity.dart';
import '../../domain/repositories/shop_item_repository.dart';

class ShopItemRepository implements IShopItemRepository {
  ShopItemRepository({
    required ShopItemSource addShopItemSource,
  }) : _addShopItemSource = addShopItemSource;

  final ShopItemSource _addShopItemSource;

  @override
  Future<Either<Failure, Unit>> add(ShopItemEntity item) async {
    try {
      await _addShopItemSource.add(item);
      return right(unit);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  // @override
  // Future<Either<Failure, Unit>> fetch() {
  //   return Future.value(right(unit));
  // }
}
