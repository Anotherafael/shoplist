import 'package:dartz/dartz.dart';
import 'package:shoplist/app/infra/datasources/shop_item_source_impl.dart';

import '../../domain/core/error/failures.dart';
import '../../domain/entities/shop_item_entity.dart';
import '../../domain/repositories/shop_item_repository.dart';

class ShopItemRepository implements IShopItemRepository {
  ShopItemRepository({
    required ShopItemSource shopItemSource,
  }) : _shopItemSource = shopItemSource;

  final ShopItemSource _shopItemSource;

  @override
  Future<Either<Failure, List<ShopItemEntity>>> fetch() async {
    try {
      List<ShopItemEntity> shopItems = await _shopItemSource.fetch();
      return right(shopItems);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> add(ShopItemEntity item) async {
    try {
      await _shopItemSource.add(item);
      return right(unit);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(ShopItemEntity item) async {
    try {
      await _shopItemSource.delete(item);
      return right(unit);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
