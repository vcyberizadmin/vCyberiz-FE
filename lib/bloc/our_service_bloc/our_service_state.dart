part of 'our_service_bloc.dart';

enum MobileNoStatus { initial, success, failure }

enum ServiceTab { global, security, emergency }

final class OurServiceState extends Equatable {
  final String error;
  final bool loading;
  final OurServiceData? data;
  final ServiceOfferingData? serviceOfferingData;
  final ServiceDetailsData? serviceDetailsData;
  final ServiceHeaderData? serviceHeaderData;
  final ServicedirectApproachData? servicedirectApproachdata;
  final ServiceTabsData? serviceTabsData;
  final int selectedItem;
  final int expandedIndex;

  const OurServiceState({
    this.error = '',
    this.loading = false,
    this.selectedItem = 0,
    this.expandedIndex = 0,
    this.data,
    this.serviceOfferingData,
    this.serviceDetailsData,
    this.serviceHeaderData,
    this.servicedirectApproachdata,
    this.serviceTabsData,
  });

  OurServiceState copyWith({
    final String? error,
    final bool? loading,
    final OurServiceData? data,
    final ServiceOfferingData? serviceOfferingData,
    final ServiceDetailsData? serviceDetailsData,
    final ServiceHeaderData? serviceHeaderData,
    final ServicedirectApproachData? servicedirectApproachdata,
    final ServiceTabsData? serviceTabsData,
    int? selectedItem,
    int? expandedIndex,
  }) {
    return OurServiceState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      data: data ?? this.data,
      serviceOfferingData: serviceOfferingData ?? this.serviceOfferingData,
      serviceDetailsData: serviceDetailsData ?? this.serviceDetailsData,
      serviceHeaderData: serviceHeaderData ?? this.serviceHeaderData,
      servicedirectApproachdata:
          servicedirectApproachdata ?? this.servicedirectApproachdata,
      serviceTabsData: serviceTabsData ?? this.serviceTabsData,
      selectedItem: selectedItem ?? this.selectedItem,
      expandedIndex: expandedIndex ?? this.expandedIndex,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        data ?? '',
        serviceOfferingData ?? '',
        serviceDetailsData ?? '',
        serviceHeaderData ?? '',
        servicedirectApproachdata ?? '',
        serviceTabsData ?? '',
        selectedItem,
        expandedIndex,
      ];
}
