import 'package:equatable/equatable.dart';

abstract class SliderEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class SliderChanged extends SliderEvents {
  final int sliderIndex;

  SliderChanged({required this.sliderIndex});
}

class GetBannerInfoSectionEvent extends SliderEvents {
  GetBannerInfoSectionEvent();
}
