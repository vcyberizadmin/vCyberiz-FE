import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/screens/contact_us_screen/widgets/custom_textfield.dart';

class CustomDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final void Function(String value)? onItemSelected;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.controller,
    this.hintText,
    this.validator,
    this.onItemSelected,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _showDropdown = ValueNotifier(false);
  late List<String> _filteredItems;

  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();

    _filteredItems = widget.items;

    _focusNode.addListener(() {
      _showDropdown.value = _focusNode.hasFocus;
      if (_focusNode.hasFocus) {
        _filterItems(widget.controller.text);
      }
    });

    widget.controller.addListener(() {
      if (_focusNode.hasFocus) {
        _filterItems(widget.controller.text);
      }
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _offset = Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero)
        .animate(_controller);
  }

  void _filterItems(String input) {
    final query = input.toLowerCase();
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          labelText: widget.label,
          controller: widget.controller,
          keyBoardType: TextInputType.text,
          validator: widget.validator,
          hintText: widget.hintText,
          suffix: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AssetConst.icDropDownSuffix),
          ),
          focusNode: _focusNode,
          onTap: () => widget.controller.clear(),
        ),
        const Gap(8),
        ValueListenableBuilder<bool>(
          valueListenable: _showDropdown,
          builder: (context, visible, _) {
            if (visible) {
              _controller.forward();
            } else {
              _controller.reverse();
            }

            return SizeTransition(
              sizeFactor: _controller,
              axisAlignment: -1,
              child: FadeTransition(
                opacity: _opacity,
                child: SlideTransition(
                  position: _offset,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.bluishGrey,
                        width: 1.5,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: ScrollbarTheme(
                      data: const ScrollbarThemeData(
                        thumbVisibility: WidgetStatePropertyAll(true),
                        trackVisibility: WidgetStatePropertyAll(false),
                        thumbColor: WidgetStatePropertyAll(Color(0xffA3A3A3)),
                        trackColor:
                            WidgetStatePropertyAll(AppColors.bluishGrey),
                        trackBorderColor:
                            WidgetStatePropertyAll(AppColors.transparent),
                        thickness: WidgetStatePropertyAll(2),
                        interactive: false,
                        crossAxisMargin: 4,
                        mainAxisMargin: 8,
                        radius: Radius.zero,
                      ),
                      child: Scrollbar(
                        child: _filteredItems.isNotEmpty
                            ? ListView.builder(
                                itemCount: _filteredItems.length,
                                itemBuilder: (context, index) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      onTap: () {
                                        widget.controller.text =
                                            _filteredItems[index];
                                        if (widget.onItemSelected != null) {
                                          widget.onItemSelected!(
                                              _filteredItems[index]);
                                        }
                                        _focusNode.unfocus(); // close dropdown
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16),
                                      title: kStyle.reg(
                                        text: _filteredItems[index],
                                        size: 14,
                                        color: AppColors.fontBlack,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text("No matching results"),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
