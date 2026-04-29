// =============================================================
// File: lib/features/pos/domain/repositories/i_pos_repository.dart
// Purpose: Updated contract to include Batch/FIFO info.
// =============================================================

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/sale_item_entity.dart';
import '../../../../core/models/product.dart';
import '../../../../core/models/product_unit.dart';
import '../../../../core/database/app_database.dart'; // To use ProductBatchDbModel

abstract class IPosRepository {
  Future<Either<Failure, List<Product>>> searchProducts(String query);
  Future<Either<Failure, Product>> lookupProduct(String barcode);
  Future<Either<Failure, List<ProductUnit>>> getProductUnits(String productId);
  
  /// Returns the oldest batch for a product to enforce FIFO.
  Future<Either<Failure, ProductBatchDbModel?>> getOldestBatch(String productId);

  Future<Either<Failure, Unit>> checkout(
    String sessionId,
    String userId,
    List<SaleItemEntity> cartItems,
    String paymentMethod,
    double paidAmount,
    String? customerId,
  );
}
