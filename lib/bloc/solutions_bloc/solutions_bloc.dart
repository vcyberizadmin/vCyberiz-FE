import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/solutions_model/emergency_responce_model.dart';
import 'package:vcyberiz/data/model/solutions_model/microsoft_security_model.dart';
import 'package:vcyberiz/data/model/solutions_model/need_help_model.dart';
import 'package:vcyberiz/data/model/solutions_model/solutions_header_data_model.dart';

import '../../data/model/solutions_model/solutions_header_model.dart';
import '../../data/model/solutions_model/solutions_we_offer_model.dart';
import '../../data/model/solutions_model/what_we_have_done_model.dart';
import '../../data/repositories/solutions_repo.dart';
part 'solutions_event.dart';
part 'solutions_state.dart';

class SolutionsBloc extends Bloc<SolutionsEvent, SolutionsState> {
  SolutionsBloc(
    this._repository,
  ) : super(const SolutionsState()) {
    on<GetHeaderEvent>(_getHeaderApi);
    on<GetSolutionsHeaderEvent>(_getSolutionsHeader);
    on<GetMicrosoftSecurityEvent>(_getMicrosoftSecurityApi);
    on<GetNeedHelpApiEvent>(_getNeedHelpApi);
    on<GetEmergencyResponceApiEvent>(_getEmergencyResponceApi);
    on<GetSolutionsWeOfferEvent>(_getSolutionsWeOffer);
    on<GetWhatWeHaveDoneEvent>(_getWhatWeHaveDone);
//!-------------Mobile Number Api Section---------------
  }
  final SolutionsRepository _repository;

  Future<void> _getHeaderApi(
    GetHeaderEvent event,
    Emitter<SolutionsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      SolutionsHeaderModel response = await _repository.getHeaderApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            headerData: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
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

  Future<void> _getSolutionsHeader(
    GetSolutionsHeaderEvent event,
    Emitter<SolutionsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      SolutionsHeaderDataModel response =
          await _repository.getSolutionsHeaderApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            solutionsHeaderData: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              solutionsHeaderData: response.data,
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

  Future<void> _getMicrosoftSecurityApi(
    GetMicrosoftSecurityEvent event,
    Emitter<SolutionsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      MicrosoftSecurityModel response =
          await _repository.getMicrosoftSecurityApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            microsoftSecurityData: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              microsoftSecurityData: response.data,
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

  Future<void> _getEmergencyResponceApi(
    GetEmergencyResponceApiEvent event,
    Emitter<SolutionsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      EmergencyResponceModel response =
          await _repository.getEmergencyResponceApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            emergencyResponceData: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              emergencyResponceData: response.data,
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

  Future<void> _getNeedHelpApi(
    GetNeedHelpApiEvent event,
    Emitter<SolutionsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      NeedHelpModel response = await _repository.getNeedHelpApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            needHelpData: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              needHelpData: response.data,
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

  Future<void> _getSolutionsWeOffer(
    GetSolutionsWeOfferEvent event,
    Emitter<SolutionsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      SolutionsWeOfferModel response =
          await _repository.getSolutionsWeOfferApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            solutionsWeOffer: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              solutionsWeOffer: response.data,
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

  Future<void> _getWhatWeHaveDone(
    GetWhatWeHaveDoneEvent event,
    Emitter<SolutionsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      WhatWeHaveDoneModel response = await _repository.getWhatWeHaveDone();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            whatWeHaveDoneData: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              whatWeHaveDoneData: response.data,
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
