import 'package:bloc/bloc.dart';

import 'hover_event.dart';
import 'hover_state.dart';

class HoverViewBloc extends Bloc<HoverViewEvents, HoverViewStates> {
  bool isMouseHover = false;

  HoverViewBloc() : super(const HoverViewStates()) {
    on<MouseHovered>(_onHovered);
  }

  _onHovered(MouseHovered event, Emitter<HoverViewStates> emit) {
    emit(
      state.copyWith(
        isMouseHover: event.isMouseHovered,
      ),
    );
  }
}
