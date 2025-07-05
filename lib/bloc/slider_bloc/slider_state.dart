import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/banner-info-model/banner_info_model.dart';

class SliderState extends Equatable {
  final int sliderIndex;
  final String error;
  final bool loading;
  final BannerInfoModel? data;

  const SliderState({
    this.sliderIndex = 0,
    this.error = '',
    this.loading = false,
    this.data,
  });

  SliderState copyWith({
    final String? error,
    final bool? loading,
    final BannerInfoModel? data,
    int? sliderIndex,
  }) {
    return SliderState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      sliderIndex: sliderIndex ?? this.sliderIndex,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        error,
        loading,
        sliderIndex,
        data,
      ];
}
