import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChange;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getValueForScreenType(
          context: context,
          mobile: 30,
          desktop: 50,
          tablet: 30,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left arrow
          InkWell(
            onTap: currentPage > 0 ? () => onPageChange(currentPage - 1) : null,
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.primaryOrangeColor,
            ),
          ),

          // First Page
          _pageButton(context, 0, isSelected: currentPage == 0),

          // Ellipsis if there's a gap after the first page
          if (currentPage > 2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: kStyle.reg(
                text: '...',
                color: Colors.black,
              ),
            ),

          // Previous Page (if applicable)
          if (currentPage > 1)
            _pageButton(context, currentPage - 1, isSelected: false),

          // Current Page
          if (currentPage != 0 && currentPage != totalPages - 1)
            _pageButton(context, currentPage, isSelected: true),

          // Next Page (if applicable)
          if (currentPage < totalPages - 2)
            _pageButton(context, currentPage + 1, isSelected: false),

          // Ellipsis if there's a gap before the last page
          if (currentPage < totalPages - 3)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text('...', style: TextStyle(color: Colors.black)),
            ),

          // Last Page
          if (totalPages > 1)
            _pageButton(context, totalPages - 1,
                isSelected: currentPage == totalPages - 1),

          // Right arrow
          InkWell(
            onTap: currentPage < totalPages - 1
                ? () => onPageChange(currentPage + 1)
                : null,
            child: const Icon(
              Icons.arrow_forward,
              color: AppColors.primaryOrangeColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageButton(BuildContext context, int index,
      {required bool isSelected}) {
    return InkWell(
      onTap: () => onPageChange(index),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orange : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: kStyle.reg(
          text: '${index + 1}'.padLeft(2, '0'),
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
