import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_header_model.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_model.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_tabs_model.dart';
import 'package:vcyberiz/data/model/our_service_model/service_direct_approach_model.dart';
import 'package:vcyberiz/data/model/our_service_model/service_offerrings_model.dart';
import 'package:vcyberiz/data/model/service_details_model/service_details_model.dart';
import 'package:vcyberiz/data/repositories/our_services_repo.dart';

part 'our_service_event.dart';
part 'our_service_state.dart';

class OurServiceBloc extends Bloc<OurServiceEvent, OurServiceState> {
  OurServiceBloc(
    this._ourServiceRepository,
  ) : super(const OurServiceState()) {
    on<GetOurServiceDataEvent>(_getOurServiceData);
    on<GetServicedetailsEvent>(_getServiceDetailsData);
    on<GetOurServiceHeaderEvent>(_getOurServiceHeaderData);
    on<GetDirectApproachEvent>(_getDirectApproachData);
    on<GetOurServiceTabsEvent>(_getOurServiceTabsData);
    on<GetServiceOfferingEvent>(_getServiceOfferingsData);
    on<TabClickEvent>(_tabClick);
    on<ToggleScopeSectionEvent>(_toggleScopeSection);
  }
  final OurServiceRepository _ourServiceRepository;
  FutureOr<void> _tabClick(
    TabClickEvent event,
    Emitter<OurServiceState> emit,
  ) {
    emit(state.copyWith(
      selectedItem: event.selectedItem,
    ));
  }

  void _toggleScopeSection(
    ToggleScopeSectionEvent event,
    Emitter<OurServiceState> emit,
  ) {
    final newIndex = state.expandedIndex == event.index ? null : event.index;

    emit(state.copyWith(expandedIndex: newIndex));
  }

  Future<void> _getOurServiceData(
    GetOurServiceDataEvent event,
    Emitter<OurServiceState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      OurServiceModel response =
          await _ourServiceRepository.getOurServiceDataApi();
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

  Future<void> _getServiceOfferingsData(
    GetServiceOfferingEvent event,
    Emitter<OurServiceState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ServiceOfferingsModel response = await _ourServiceRepository
          .getServiceOfferingsDataApi(documentId: event.documentId);
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, serviceOfferingData: response.data),
          );
        });
      } else {
        emit(
          state.copyWith(
            serviceOfferingData: null,
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          serviceOfferingData: null,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _getServiceDetailsData(
    GetServicedetailsEvent event,
    Emitter<OurServiceState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ServiceDetailsModel response =
          await _ourServiceRepository.getServiceDetailsApi(
        documentId: event.documentId,
      );
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              serviceDetailsData: response.data,
            ),
          );
        });
        if (response.data?.serviceOfferingIsRequired != null) {
          add(GetServiceOfferingEvent(documentId: event.documentId));
        }
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

  Future<void> _getOurServiceHeaderData(
    GetOurServiceHeaderEvent event,
    Emitter<OurServiceState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ServiceHeaderModel response =
          await _ourServiceRepository.getOurServiceHeaderApi();
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              serviceHeaderData: response.data,
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

  Future<void> _getDirectApproachData(
    GetDirectApproachEvent event,
    Emitter<OurServiceState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ServiceDirectApproachModel response =
          await _ourServiceRepository.getDirectApproachData();
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
                loading: false, servicedirectApproachdata: response.data),
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

  Future<void> _getOurServiceTabsData(
    GetOurServiceTabsEvent event,
    Emitter<OurServiceState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ServiceTabsModel response =
          await _ourServiceRepository.getOurServiceTabsData();
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, serviceTabsData: response.data),
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
