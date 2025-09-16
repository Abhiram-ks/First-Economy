import 'package:firsteconomy/features/domain/entity/banner_entity.dart';
import 'package:firsteconomy/features/domain/repo/banner_repo.dart';

class GetBannersUseCase {
  final BannerRepository repository;

  GetBannersUseCase({required this.repository});

  Stream<List<BannerEntity>> call() {
    return repository.getBanners();
  }
}
