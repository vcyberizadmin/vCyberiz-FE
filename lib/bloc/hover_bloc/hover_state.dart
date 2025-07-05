import 'package:equatable/equatable.dart';

class HoverViewStates extends Equatable {
  final bool isMouseHover;

  const HoverViewStates({
    this.isMouseHover = false,
  });

  HoverViewStates copyWith({
    bool? isMouseHover,
  }) {
    return HoverViewStates(
      isMouseHover: isMouseHover ?? this.isMouseHover,
    );
  }

  @override
  List<Object?> get props => [
        isMouseHover,
      ];
}
