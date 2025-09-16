

import 'package:firsteconomy/features/domain/entity/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required super.id,
    required super.bannerImage,
    required super.sortOrder,
    required super.status,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      bannerImage: json['banner_image'],
      sortOrder: json['sort_order'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'banner_image': bannerImage,
      'sort_order': sortOrder,
      'status': status,
    };
  }
}
