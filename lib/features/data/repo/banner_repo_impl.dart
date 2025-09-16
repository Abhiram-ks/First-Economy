import 'package:firsteconomy/features/data/datasource/banner_remote_datasource.dart';
import 'package:firsteconomy/features/domain/entity/banner_entity.dart' show BannerEntity;
import 'package:firsteconomy/features/domain/repo/banner_repo.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDatasource remoteDatasource;

  BannerRepositoryImpl({required this.remoteDatasource});

  @override
  Stream<List<BannerEntity>> getBanners() {
    return remoteDatasource.fetchBanners();
  }
}