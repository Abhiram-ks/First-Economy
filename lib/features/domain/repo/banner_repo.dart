import 'package:firsteconomy/features/domain/entity/banner_entity.dart';

abstract class BannerRepository {
  Stream<List<BannerEntity>> getBanners();
}