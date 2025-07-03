part of 'login_bloc.dart';

enum LoadingStatus {
  initial,
  loading,
  success,
  failure,
}

class LoginState extends Equatable {
  final LoadingStatus? status;
  final String email;
  final String password;
  final String tokenValue;
  final bool isObscure;
  final bool? isReCaptchaChecked;
  final bool? showReCaptChaError;
  final bool loadingToken;
  final bool captchaChecked;
  final LoadingStatus? loadingStatus;

  const LoginState({
    this.status = LoadingStatus.initial,
    this.email = '',
    this.password = '',
    this.tokenValue = '',
    this.isObscure = true,
    this.isReCaptchaChecked,
    this.loadingToken = false,
    this.showReCaptChaError,
    this.captchaChecked = false,
    this.loadingStatus = LoadingStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? tokenValue,
    LoadingStatus? status,
    LoadingStatus? loadingStatus,
    bool? isObscure,
    bool? isReCaptchaChecked,
    bool? loadingToken,
    bool? showReCaptChaError,
    bool? captchaChecked,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isObscure: isObscure ?? this.isObscure,
      status: status ?? this.status,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      isReCaptchaChecked: isReCaptchaChecked ?? this.isReCaptchaChecked,
      tokenValue: tokenValue ?? this.tokenValue,
      loadingToken: loadingToken ?? this.loadingToken,
      showReCaptChaError: showReCaptChaError ?? this.showReCaptChaError,
      captchaChecked: captchaChecked ?? this.captchaChecked,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        status ?? LoadingStatus.initial,
        loadingStatus ?? LoadingStatus.initial,
        isObscure,
        isReCaptchaChecked ?? false,
        loadingToken,
        tokenValue,
        showReCaptChaError ?? false,
        captchaChecked,
      ];
}
