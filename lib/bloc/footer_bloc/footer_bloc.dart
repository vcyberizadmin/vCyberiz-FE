import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/footer_model/footer_model.dart';

import '../../data/model/subscribe_model.dart';
import '../../data/repositories/footer_repo.dart';

part 'footer_event.dart';
part 'footer_state.dart';

class FooterBloc extends Bloc<FooterEvent, FooterState> {
  FooterBloc(
    this._FooterRepository,
  ) : super(const FooterState()) {
    on<GetFooterEvent>(_getfooterData);
    on<SubscribeEvent>(_getSubscribe);
  }
  final FooterRepository _FooterRepository;

  Future<void> _getfooterData(
    GetFooterEvent event,
    Emitter<FooterState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      FooterModel response = (await _FooterRepository.getFooterApi());
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, data: response.data),
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

  Future<void> _getSubscribe(
    SubscribeEvent event,
    Emitter<FooterState> emit,
  ) async {
    try {
      SubscribeModel response =
          (await _FooterRepository.getSubscribeApi(event.email));
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              subscribed: true,
            ),
          );
        });
        await Future.delayed(
            const Duration(
              seconds: 5,
            ), () {
          return emit(
            state.copyWith(
              subscribed: false,
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
}
