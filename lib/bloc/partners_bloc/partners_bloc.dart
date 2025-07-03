import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/repositories/partners_repo.dart';

import '../../data/model/partners_model/partners_header_model.dart';
import '../../data/model/partners_model/partners_technology_model.dart';
import '../../data/model/partners_model/secure_stronger_future.dart';

part 'partners_event.dart';
part 'partners_state.dart';

class PartnersBloc extends Bloc<PartnersEvent, PartnersState> {
  PartnersBloc(
    this._repository,
  ) : super(const PartnersState()) {
    on<GetPartnersHeaderEvent>(_getPartnersHeader);
    on<GetTechnologyPartnersEvent>(_getTechnologyPartners);
    on<GetSecureStrongFutureEvent>(_getSecureStrongFuturePartners);
    on<TabClickEvent>(_tabClick);
  }
  final PartnersRepository _repository;
  FutureOr<void> _tabClick(
    TabClickEvent event,
    Emitter<PartnersState> emit,
  ) {
    emit(state.copyWith(
      selectedItem: event.selectedItem,
    ));
  }

  FutureOr<void> _getPartnersHeader(
      GetPartnersHeaderEvent event, Emitter<PartnersState> emit) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      PartnersHeaderModel response = await _repository.getPartnerHeaderApi();
      if (response.data != null) {
        emit(state.copyWith(loading: false, headerData: response.data));
      } else {
        emit(state.copyWith(error: "no data found"));
      }
    } catch (e) {
      return emit(state.copyWith(error: e.toString()));
    }
  }

  FutureOr<void> _getTechnologyPartners(
    GetTechnologyPartnersEvent event,
    Emitter<PartnersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      PartnersTechnologyModel response =
          await _repository.getTechnologyParntnersApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            technology: response.data,
          ),
        );
      } else {
        emit(
          state.copyWith(error: "no data found"),
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

  FutureOr<void> _getSecureStrongFuturePartners(
    GetSecureStrongFutureEvent event,
    Emitter<PartnersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      SecureStrongerFutureModel response =
          await _repository.getPartnerSecureFutureApi();
      if (response.data != null) {
        emit(state.copyWith(
          loading: false,
          secureFuture: response.data,
        ));
      } else {
        emit(
          state.copyWith(error: "no data found"),
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
