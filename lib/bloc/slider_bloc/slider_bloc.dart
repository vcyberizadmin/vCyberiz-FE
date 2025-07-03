import 'package:bloc/bloc.dart';
import 'package:vcyberiz/data/model/banner-info-model/banner_info_model.dart';
import 'package:vcyberiz/data/repositories/banner_info_repo.dart';

import 'slider_event.dart';
import 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvents, SliderState> {
  bool isMouseHover = false;
  final BannerInfoRepository _repository;
  SliderBloc(this._repository) : super(const SliderState()) {
    on<SliderChanged>(_onSlideChanged);
    on<GetBannerInfoSectionEvent>(_getBannerInfoSectionEvent);
  }

  _onSlideChanged(SliderChanged event, Emitter<SliderState> emit) {
    return emit(
      state.copyWith(
        sliderIndex: event.sliderIndex,
      ),
    );
  }

  Future<void> _getBannerInfoSectionEvent(
    GetBannerInfoSectionEvent event,
    Emitter<SliderState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      BannerInfoModel response = await _repository.getBannerInfoDataApi();

      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            data: response,
          ),
        );
      } else {
        emit(
          state.copyWith(
            loading: false,
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          loading: false,
          error: e.toString(),
        ),
      );
    }
  }
}
