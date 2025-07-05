import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/our_solutions_model/our_solutions_model.dart';
import '../../data/repositories/our_solution_repo.dart';
part 'our_solutions_event.dart';
part 'our_solutions_state.dart';

class OurSolutionsBloc extends Bloc<OurSolutionsEvent, OurSolutionsState> {
  OurSolutionsBloc(
    this._repository,
  ) : super(const OurSolutionsState()) {
    on<GetOurSolutionsDataEvent>(_getOurSolutionsData);
//!-------------Mobile Number Api Section---------------
    on<SelectIndexEvent>(_selectIndex);
  }
  final OurSolutionsRepository _repository;
  Future<void> _selectIndex(
    SelectIndexEvent event,
    Emitter<OurSolutionsState> emit,
  ) async {
    return emit(
      state.copyWith(
        selectedIndex: event.index,
      ),
    );
  }

  Future<void> _getOurSolutionsData(
    GetOurSolutionsDataEvent event,
    Emitter<OurSolutionsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      OurSolutionsModel response = await _repository.getOurSolutionsDataApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            data: response.data,
          ),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          String? currentImageUrl;
          OurSolutionsData? data = response.data;

          // //Set first item expanded value true
          // if (data?.solutionAccordian != null &&
          //     data!.solutionAccordian!.isNotEmpty) {
          //   final updatedSolutionAccordianList =
          //       data.solutionAccordian!.toList();
          //   updatedSolutionAccordianList[0] =
          //       updatedSolutionAccordianList[0].copyWith(isExpanded: true);
          //   data =
          //       data.copyWith(solutionAccordian: updatedSolutionAccordianList);

          //   //Set Current item imgUrl
          //   currentImageUrl =
          //       updatedSolutionAccordianList[0].imageUrl?.formats?.small?.url ??
          //           "";
          // }
          return emit(
            state.copyWith(
              loading: false,
              data: data,
              currentImageUrl: currentImageUrl,
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
