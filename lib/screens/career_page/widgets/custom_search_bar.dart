import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final GlobalKey menuKey = GlobalKey();

  TextEditingController searchController = TextEditingController();

  TextEditingController locationSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CareersBloc, CareersState>(
      builder: (context, state) {
        return ResponsiveBuilder(builder: (context, sizingInformation) {
          if (sizingInformation.isDesktop) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //!--------- Search By TextField
                Expanded(
                  flex: 2,
                  child: searchTextField(
                    state,
                  ),
                ),
                const Gap(20),

                //!-------- City, State TextField
                Expanded(
                  flex: 2,
                  child: cityStateTextField(context, state),
                ),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //!--------- Search By TextField
              searchTextField(
                state,
              ),
              const Gap(10),

              //!-------- City, State TextField
              cityStateTextField(context, state),
            ],
          );
        });
      },
    );
  }

  Widget searchTextField(CareersState state) {
    return Container(
      height: 65,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TextFormField(
        controller: searchController,
        style: TextStyle(
          color: AppColors.lightgrey,
          fontFamily: Constants.font,
          fontSize: getValueForScreenType(
            context: context,
            mobile: 14,
            tablet: 15,
            desktop: 16,
          ),
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: AppColors.lightgrey,
            fontFamily: Constants.font,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
          ),
          hintText: state.filterData?.form?[0].label,
          border: InputBorder.none,
          icon: ImageWidget(
            imageUrl: state.filterData?.formFieldIcons?[0].fieldIcon?.url ?? '',
            label: state.filterData?.formFieldIcons?[0].fieldIcon?.name ?? '',
            height: 25,
            width: 25,
          ),
        ),
      ),
    );
  }

  Widget cityStateTextField(
    BuildContext context,
    CareersState state,
  ) {
    return Container(
      height: 65,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: locationSearch,
              style: TextStyle(
                color: AppColors.lightgrey,
                fontFamily: Constants.font,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  tablet: 15,
                  desktop: 16,
                ),
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: AppColors.lightgrey,
                  fontFamily: Constants.font,
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 14,
                    tablet: 15,
                    desktop: 16,
                  ),
                ),
                hintText: state.filterData?.form?[1].label,
                border: InputBorder.none,
                icon: ImageWidget(
                  imageUrl:
                      state.filterData?.formFieldIcons?[1].fieldIcon?.url ?? '',
                  label: state.filterData?.formFieldIcons?[1].fieldIcon?.name ??
                      '',
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          ),
          const Gap(10),
          // //!------- Filters Button
          // _containerWidget(
          //   state: state,
          //   context: context,
          //   items: [
          //     PopupMenuItem<int>(
          //       height: 30,
          //       child: FilterPopup(),
          //     ),
          //   ],
          // ),
          // const Gap(8),
          //!-------- Find Job Button
          findJobButton(context, state),
        ],
      ),
    );
  }

  CustomButtonWidget findJobButton(
    BuildContext context,
    CareersState state,
  ) {
    return CustomButtonWidget(
      text: state.filterData?.form?[4].label ?? '',
      bgButtonColor: AppColors.darkOrangeColor,
      onTap: () {
        context.read<CareersBloc>().add(
              GetPaginationDataEvent(
                currentIndex: 0,
                itemCount: getValueForScreenType(
                  context: context,
                  mobile: 3,
                  desktop: 9,
                  tablet: 6,
                ),
                dataList: state.careerList,
                search: searchController.text,
                locationSearch: locationSearch.text,
              ),
            );
      },
    );
  }

//!------------(filter section)
  Widget filterButton(CareersState state) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Row(
          children: [
            ImageWidget(
              imageUrl:
                  state.filterData?.formFieldIcons?[3].fieldIcon?.url ?? '',
              label: state.filterData?.formFieldIcons?[3].fieldIcon?.name ?? '',
              height: 25,
              width: 25,
            ),
            const Gap(10),
            kStyle.reg(
              text: state.filterData?.form?[3].label ?? '',
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  // Widget _containerWidget({
  //   required CareersState state,
  //   required List<PopupMenuItem> items,
  //   required BuildContext context,
  // }) {
  //   return Builder(
  //     builder: (context) {
  //       return InkWell(
  //         onTap: () async {
  //           final RenderBox renderBox = context.findRenderObject() as RenderBox;
  //           final Offset offset = renderBox.localToGlobal(Offset.zero);
  //           final double menuWidth =
  //               300; // Adjust this based on actual menu width

  //           final RelativeRect position = RelativeRect.fromLTRB(
  //             offset.dx - 200, // Moves left by 100px
  //             offset.dy + renderBox.size.height,
  //             offset.dx - 100 + menuWidth, // Keep menu width consistent
  //             offset.dy + renderBox.size.height + 200, // Adjust height for menu
  //           );

  //           await showMenu(
  //             context: context,
  //             color: AppColors.white,
  //             position: position,
  //             items: items,
  //           );
  //         },
  //         child: filterButton(state),
  //       );
  //     },
  //   );
  // }
}
