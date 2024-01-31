import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shoplist/app/domain/core/error/failures.dart';
import 'package:shoplist/app/domain/core/usecase.dart';
import 'package:shoplist/app/domain/entities/shop_item_entity.dart';

import '../repositories/shop_item_repository.dart';

class AddItemShop implements UseCase<Unit, Params> {
  AddItemShop(
    this.repository,
  );

  final IShopItemRepository repository;

  @override
  Future<Either<Failure, Unit>> call(Params params) {
    return repository.add(params.shopItemEntity);
  }
}

class Params extends Equatable {
  const Params({
    required this.context,
    required this.shopItemEntity,
  });

  final BuildContext context;
  final ShopItemEntity shopItemEntity;

  @override
  List<Object> get props => [shopItemEntity, context];
}
