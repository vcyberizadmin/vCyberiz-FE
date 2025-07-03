import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/contact_us_banner_model/contact_us_banner_model.dart';

import '../../data/model/contact_us_model/contact_us_header_model.dart';
import '../../data/model/contact_us_model/contact_us_locations_model.dart';
import '../../data/repositories/contact_us_repo.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc(
    this._repository,
  ) : super(const ContactUsState()) {
    on<GetContactUsHeaderEvent>(_getContactUsHeader);
    on<GetContactUsBannerEvent>(_getContactUsBanner);
    on<GetOurLocationsEvent>(_getOurLocations);
    on<SelectCountryEvent>(_selectCountry);
    on<GetSubmitDetailsEvent>(_submitTapEvent);

//!-------------Mobile Number Api Section---------------
  }
  final ContactUsRepository _repository;

  Future<void> _selectCountry(
    SelectCountryEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    return emit(
      state.copyWith(
        loading: false,
        selectedCountry: event.country,
      ),
    );
  }

  Future<void> _getContactUsHeader(
    GetContactUsHeaderEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ContactUsHeaderModel response = await _repository.getContactUsHeaderApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            headerData: response.data,
          ),
        );
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

  Future<void> _getContactUsBanner(
    GetContactUsBannerEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ContactUsBanner response = await _repository.getContactUsHeadingBanner();
      emit(
        state.copyWith(
          loading: false,
          bannerData: response,
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _getOurLocations(
    GetOurLocationsEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ContactUsLocationModel response = await _repository.getOurLocationsApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            locationsData: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              locationsData: response.data,
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

  Future<void> _submitTapEvent(
    GetSubmitDetailsEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ContactUsHeaderModel response = await _repository.submitDetails(
        event.name,
        event.email,
        event.companyName,
        event.countryName,
        event.interest,
        event.comment,
      );
      if (response.data != null) {
        emit(
          state.copyWith(
            submitStatus: SubmitStatus.success,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              submitStatus: SubmitStatus.initial,
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
