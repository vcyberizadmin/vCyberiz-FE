import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/about_us_model/about_us_headermodel.dart';
import '../../data/model/about_us_model/about_us_model.dart';
import '../../data/model/about_us_model/about_us_our_secret_model.dart';
import '../../data/model/about_us_model/about_us_our_values_model.dart';
import '../../data/model/about_us_model/about_us_our_vision_service.dart';
import '../../data/model/about_us_model/about_us_shield_model.dart';
import '../../data/repositories/about_us_repo.dart';

part 'about_us_event.dart';
part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  AboutUsBloc(
    this._repository,
  ) : super(const AboutUsState()) {
    on<GetAboutUsDataEvent>(_getAboutUsData);
    on<GetAboutUsHeaderEvent>(_getAboutUsHeader);
    on<GetAboutUsShieldEvent>(_getAboutUsShield);
    on<GetAboutUsOurSecretsEvent>(_getAboutUsOurSecrets);
    on<GetAboutUsOurVisionEvent>(_getAboutUsOurVision);
    on<GetAboutUsOurValuesEvent>(_getAboutUsOurValues);
  }
  final AboutUsRepository _repository;

//!-------------AboutUs---------------

  Future<void> _getAboutUsData(
    GetAboutUsDataEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      AboutUsModel response = (await _repository.getAboutUsDataApi());
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, homeAboutUsData: response.data),
          );
        });
      } else {
        emit(
          state.copyWith(
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }

//!-------------AboutUs Header---------------

  Future<void> _getAboutUsHeader(
    GetAboutUsHeaderEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    emit(
      state.copyWith(
        headerLoading: true,
      ),
    );
    try {
      AboutUsHeaderModel response = await _repository.getAboutUsHeaderApi();
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              headerLoading: false,
              headerData: response.data,
            ),
          );
        });
      } else {
        emit(
          state.copyWith(
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }
  //!-------------AboutUs schield---------------

  Future<void> _getAboutUsShield(
    GetAboutUsShieldEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      AboutUsOurShieldModel response =
          (await _repository.getAboutUsShieldApi());
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, ourShieldData: response.data),
          );
        });
      } else {
        emit(
          state.copyWith(
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }

//!-------------AboutUs Our secrets---------------
  Future<void> _getAboutUsOurSecrets(
    GetAboutUsOurSecretsEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      AboutUsOurSecretModel response = (await _repository.getOurSecretsApi());
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, ourSecretData: response.data),
          );
        });
      } else {
        emit(
          state.copyWith(
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }

//!-------------AboutUs Our values---------------

  Future<void> _getAboutUsOurVision(
    GetAboutUsOurVisionEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      AboutUsOurVisionModel response = await _repository.getOurVisionApi();
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, ourVisionData: response.data),
          );
        });
      } else {
        emit(
          state.copyWith(
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _getAboutUsOurValues(
    GetAboutUsOurValuesEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      AboutUsOurValuesModel response = await _repository.getOurValuesApi();
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, ourValuesData: response.data),
          );
        });
      } else {
        emit(
          state.copyWith(
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }
}
