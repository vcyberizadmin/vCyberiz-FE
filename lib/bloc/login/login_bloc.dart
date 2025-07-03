import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:vcyberiz/core/utils/constants/api_const.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //*--------(repo instance)
  LoginBloc() : super(const LoginState()) {
    on<LoginInit>(_onInit);
    on<ReCaptchaCheckEvent>(_onReCaptchaCheckEvent);
    on<OnPasswordObscure>(_onPassObscure);
    on<ReCaptchaTapEvent>(_onReCaptchaCheck);
    on<ReCaptchaTapEvent2>(_onReCaptchaCheck2);
    on<ReCaptchaCheckEvent3>(_onReCaptchaChecksubmit);
  }
//*-------(on login init)
  _onInit(LoginInit event, Emitter<LoginState> emit) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kIsWeb) {
      //!---(setting Re captcha)
      await GRecaptchaV3.ready(ApiConst.reCaptchaKey, showBadge: false);
    }
    emit(const LoginState(
      isReCaptchaChecked: false,
      status: LoadingStatus.initial,
      loadingStatus: LoadingStatus.loading,
    ));
  }

  _onReCaptchaCheckEvent(
      ReCaptchaCheckEvent event, Emitter<LoginState> emit) async {
    if (state.isReCaptchaChecked ?? false) {
      emit(state.copyWith(showReCaptChaError: false));
    } else {
      emit(state.copyWith(showReCaptChaError: true));
    }
  }

  _onPassObscure(OnPasswordObscure event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        isObscure: !state.isObscure, status: LoadingStatus.initial));
  }

  FutureOr<void> _onReCaptchaCheck(
      ReCaptchaTapEvent event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(loadingToken: true),
    );
    if (event.checkBoxValue) {
      String token = await GRecaptchaV3.execute('submit') ?? 'null returned';
      GRecaptchaV3.hideBadge();
      emit(
        state.copyWith(
          isReCaptchaChecked: true,
          tokenValue: token,
          loadingToken: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isReCaptchaChecked: false,
          tokenValue: '',
          loadingToken: false,
        ),
      );
    }
  }

  FutureOr<void> _onReCaptchaCheck2(
      ReCaptchaTapEvent2 event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        isReCaptchaChecked: false,
        tokenValue: '',
      ),
    );
  }

  FutureOr<void> _onReCaptchaChecksubmit(
      ReCaptchaCheckEvent3 event, Emitter<LoginState> emit) async {
    if (state.status != LoadingStatus.failure) {
      emit(state.copyWith(captchaChecked: true));
    }
  }
}
