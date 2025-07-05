import 'package:equatable/equatable.dart';

abstract class HoverViewEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class HoverEntered extends HoverViewEvents {}

class MouseHovered extends HoverViewEvents {
  final bool isMouseHovered;

  MouseHovered(this.isMouseHovered);

  @override
  List<Object> get props => [
        isMouseHovered,
      ];
}

class HoverExited extends HoverViewEvents {}
