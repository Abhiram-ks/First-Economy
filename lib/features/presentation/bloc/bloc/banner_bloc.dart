import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firsteconomy/features/domain/entity/banner_entity.dart';
import 'package:firsteconomy/features/domain/usecase/banner_usecase.dart';
import 'package:flutter/material.dart';
part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannersUseCase getBannersUseCase;

  BannerBloc({required this.getBannersUseCase}) : super(BannerInitial()) {
    on<FetchBannerEvent>(_onFetchBanners);
  }

  Future<void> _onFetchBanners(
    FetchBannerEvent event,
    Emitter<BannerState> emit,
  ) async {
    emit(BannerLoading());

    try {
      await emit.forEach<List<BannerEntity>>(
        getBannersUseCase(),
        onData: (banners) {
          if (banners.isEmpty) {
            return BannerEmpty();
          } else {
            return BannerLoaded(banners: banners);
          }
        },
        onError: (error, stackTrace) {
          return BannerError(message: error.toString());
        },
      );
    } catch (e) {
      emit(BannerError(message: 'Unexpected error: $e'));
    }
  }
}
