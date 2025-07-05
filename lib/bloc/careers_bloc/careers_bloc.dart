import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vcyberiz/data/model/careers_model/career_details_model.dart';
import 'package:vcyberiz/data/model/careers_model/career_filter_Model.dart';
import 'package:vcyberiz/data/model/careers_model/submit_resume_model.dart';
import 'package:vcyberiz/data/model/careers_model/upload_pdf_model.dart';

import '../../data/model/careers_model/career_header_model.dart';
import '../../data/model/careers_model/career_list_model.dart';
import '../../data/repositories/careers_repo.dart';
part 'careers_event.dart';
part 'careers_state.dart';

class CareersBloc extends Bloc<CareersEvent, CareersState> {
  CareersBloc(
    this._repository,
  ) : super(const CareersState()) {
    on<GetCareersHeaderEvent>(_getCareersHeader);
    on<UploadPdfEvent>(_getUploadUrl);
    on<SubmitEvent>(_submitResumeEvent);
    on<GetCareerFilterDataEvent>(_getCareerFilterApi);
    on<GetCareerListEvent>(_getCareerListApi);
    on<GetCareerDetailsEvent>(_getCareerDetailsApi);
    on<GetPaginationDataEvent>(_getPaginationData);
    on<SelectFilterEvent>(_getSelectFilterEvent);
    on<ClearFilterEvent>(_clearFilterEvent);
  }
  final CareersRepository _repository;

  Future<void> _clearFilterEvent(
    ClearFilterEvent event,
    Emitter<CareersState> emit,
  ) async {
    emit(
      state.copyWith(
        sortText: state.filterData?.secBody?[0].secItems?.first.secText ?? '',
        filerText: state.filterData?.secBody?[1].secItems?.first.secText ?? '',
        functionText:
            state.filterData?.secBody?[2].secItems?.first.secText ?? '',
        locationText:
            state.filterData?.secBody?[3].secItems?.first.secText ?? '',
      ),
    );
  }

  Future<void> _getSelectFilterEvent(
    SelectFilterEvent event,
    Emitter<CareersState> emit,
  ) async {
    if (event.header == 'Sort by') {
      emit(
        state.copyWith(
          sortText: event.text,
        ),
      );
    } else if (event.header == 'Filters') {
      emit(
        state.copyWith(
          filerText: event.text,
        ),
      );
    } else if (event.header == 'Function') {
      emit(
        state.copyWith(
          functionText: event.text,
        ),
      );
    } else if (event.header == 'Location') {
      emit(
        state.copyWith(
          locationText: event.text,
        ),
      );
    } else {}
  }

  Future<void> _getCareersHeader(
    GetCareersHeaderEvent event,
    Emitter<CareersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      CareerHeaderModel response = await _repository.getCareersHeaderApi();
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

  Future<void> _getUploadUrl(
    UploadPdfEvent event,
    Emitter<CareersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      UploadPdfModel response = await _repository.getUploadUrlApi(event.file);
      if (response.url != '' && response.url != null) {
        add(SubmitEvent(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          phone: event.phone,
          linkedIn: event.linkedIn,
          url: response.url ?? '',
        ));
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

  Future<void> _submitResumeEvent(
    SubmitEvent event,
    Emitter<CareersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      SubmitResumeModel response = await _repository.submitResumeApi(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        phone: event.phone,
        linkedIn: event.linkedIn,
        url: event.url,
      );
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            submitResumeStatus: SubmitResumeStatus.success,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              submitResumeStatus: SubmitResumeStatus.initial,
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

  Future<void> _getCareerFilterApi(
    GetCareerFilterDataEvent event,
    Emitter<CareersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      CareerFilterModel response = await _repository.getCareerFilterApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            filterData: response.data,
            sortText: response.data?.secBody?[0].secItems?.first.secText ?? '',
            filerText: response.data?.secBody?[1].secItems?.first.secText ?? '',
            functionText:
                response.data?.secBody?[2].secItems?.first.secText ?? '',
            locationText:
                response.data?.secBody?[3].secItems?.first.secText ?? '',
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              filterData: response.data,
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

  Future<void> _getCareerListApi(
    GetCareerListEvent event,
    Emitter<CareersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      CareerListModel response = await _repository.getCareerListApi();

      if (response.data != null) {
        add(GetPaginationDataEvent(
          currentIndex: 0,
          dataList: response.data,
          itemCount: event.itemCount,
          search: state.searchText,
          locationSearch: state.locationSearch,
        ));
        emit(
          state.copyWith(
            loading: false,
            careerList: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              careerList: response.data,
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

  Future<void> _getCareerDetailsApi(
    GetCareerDetailsEvent event,
    Emitter<CareersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      CareerDetailsModel response = await _repository.getCareerDetailsApi(
        documentId: event.documentId,
      );

      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            careerData: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              careerData: response.data,
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

  FutureOr<void> _getPaginationData(
    GetPaginationDataEvent event,
    Emitter<CareersState> emit,
  ) async {
    int itemsPerPage = event.itemCount;
    if (event.dataList == null || event.dataList!.isEmpty) {
      emit(state.copyWith(
        currentPageIndex: 0,
        pagesCount: 0,
        eventList: [],
        searchText: event.search,
      ));
      return;
    }

    // Start with the full list
    List<CareerListData> filteredList = List.from(event.dataList!);

    // Sort the list based on the selected sortText
    if (state.sortText == "Alphabetical") {
      filteredList.sort((a, b) => a.secHeader!.compareTo(b.secHeader!));
    } else if (state.sortText == "Date Posted") {
      filteredList.sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
    }
    // Filter data based on state.locationText
    filteredList = state.locationText == "All"
        ? filteredList
        : filteredList
            .where(
                (career) => career.zipCode?.country?.text == state.locationText)
            .toList();
    // Filter data based on state.locationText
    if (state.filterText != 'All Employment types') {
      filteredList = filteredList
          .where((career) => career.employmentTypes!
              .any((loc) => loc.secText == state.filterText))
          .toList();
    }
    // if (state.functionText != 'All') {
    //   filteredList = filteredList
    //       .where(
    //         (career) => career.function?.secText == state.functionText,
    //       )
    //       .toList();
    // }

    // Apply search filter
    if (event.search.isNotEmpty) {
      filteredList = filteredList.where((career) {
        return career.secHeader!
                .toLowerCase()
                .contains(event.search.toLowerCase()) ||
            career.secHeader!
                .toLowerCase()
                .contains(event.search.toLowerCase());
      }).toList();
    } // Apply search filter
    if (event.locationSearch.isNotEmpty) {
      filteredList = filteredList.where((career) {
        return (career.zipCode?.country?.text ?? '')
                .toLowerCase()
                .contains(event.locationSearch.toLowerCase()) ||
            career.zipCode!.name!
                .toLowerCase()
                .contains(event.locationSearch.toLowerCase());
      }).toList();
    }

    // Calculate total pages
    final totalPages = (filteredList.length / itemsPerPage).ceil();

    // Adjust for out-of-bounds current index
    int currentIndex = event.currentIndex;
    if (currentIndex < 0 || currentIndex >= totalPages) {
      currentIndex = 0;
    }

    // Calculate paginated items
    final startIndex = currentIndex * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage) > filteredList.length
        ? filteredList.length
        : (startIndex + itemsPerPage);
    final paginatedItems = filteredList.sublist(startIndex, endIndex);

    // Emit the updated state
    emit(state.copyWith(
      currentPageIndex: currentIndex,
      pagesCount: totalPages,
      eventList: paginatedItems,
      searchText: event.search,
    ));
  }
}
