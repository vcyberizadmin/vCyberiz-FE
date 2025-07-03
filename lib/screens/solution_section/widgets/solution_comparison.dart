import 'package:flutter/material.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import 'build_solution_card_widget.dart';

class SolutionsComparisonScreen extends StatelessWidget {
  const SolutionsComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          //!-------(Title)
          child: titleText(),
        ),
        _buildSolutionCard(context),
      ],
    );
  }

  Widget _buildSolutionCard(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of grid columns based on screen width
    int gridColumnCount = 1; // Default to 1 column for mobile
    if (screenWidth > 1200) {
      gridColumnCount = 4; // Desktop
    } else if (screenWidth >= 768) {
      gridColumnCount = 2; // Tablet
    }

    final List<Widget> solutionCards = [
      const BuildSolutionCardWidget(
        lineColor: AppColors.yellow,
        tileColor: AppColors.yellow,
        title: 'vShield',
        subtitle: 'Essential Security for SMBs',
        licenses: 'Licenses: A1, F1, Business, Basic',
        features: [
          '8x5 Alert Monitoring',
          'Incident Support',
          'AI-Powered Reporting',
          'Dashboard',
          'VIP monitoring',
          'UEBA for IT, AI-powered SOAR',
          'vProtect, and SIEM',
          'Response, Threat-Hunting',
        ],
      ),
      const BuildSolutionCardWidget(
        lineColor: AppColors.blue,
        tileColor: AppColors.blue,
        title: 'vArmor',
        subtitle: 'Elevated Security for SMCs',
        licenses: 'Licenses: A3, F3, Business, Standard, MES',
        features: [
          '24x5 Alert Monitoring, Incident Response',
          'AI-Powered Reporting',
          'Incident Support',
          'Dashboard',
          'VIP monitoring',
          'UEBA for IT, AI-powered SOAR',
          'vProtect, and SIEM',
          'Response, Threat-Hunting',
        ],
      ),
      const BuildSolutionCardWidget(
        lineColor: AppColors.grey,
        tileColor: AppColors.grey,
        title: 'vFortify',
        subtitle: 'Comprehensive Security for Enterprise',
        licenses: 'Licenses: A6, F5, Business, Premium, MES, Sentinel',
        features: [
          'vProtect, and SIEM',
          'UEBA for IT, AI-powered SOAR',
          'VIP monitoring',
          'Dashboard',
          'AI-Powered',
          'UEBA for IT, AI-powered SOAR',
          'vProtect, and SIEM',
          'Response, Threat-Hunting',
        ],
      ),
      BuildSolutionCardWidget(
        lineColor: AppColors.blue.withOpacity(0.7),
        tileColor: AppColors.blue.withOpacity(0.7),
        title: 'vProtect',
        subtitle: 'Enhanced Security for SMEs',
        licenses: 'Licenses: A5, F5, Business, Premium, MES',
        features: const [
          '24x7 Monitoring,Advanced Response,Threat-Hunting',
          'AI-Powered',
          'Dashboard',
          'UEBA for IT, AI-powered SOAR',
          'vProtect, and SIEM',
        ],
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridColumnCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2 / 3,
        ),
        itemCount: solutionCards.length,
        itemBuilder: (context, index) {
          return Expanded(child: solutionCards[index]);
        },
      ),
    );
  }
}

// class SolutionsComparisonScreen extends StatelessWidget {
//   const SolutionsComparisonScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 40,
//             horizontal: 20,
//           ),
//           //!-------(Title)
//           child: titleText(),
//         ),
//         _buildSolutionCard(),
//       ],
//     );
//   }

//   Row _buildSolutionCard() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         const BuildSolutionCardWidget(
//           lineColor: AppColors.yellow,
//           tileColor: AppColors.yellow,
//           title: 'vShield',
//           subtitle: 'Essential Security for SMBs',
//           licenses: 'Licenses: A1, F1, Business, Basic',
//           features: [
//             '8x5 Alert Monitoring',
//             'Incident Support',
//             'AI-Powered Reporting',
//             'Dashboard',
//             'VIP monitoring',
//             'UEBA for IT, AI-powered SOAR',
//             'vProtect, and SIEM',
//             'Response, Threat-Hunting',
//           ],
//         ),
//         const BuildSolutionCardWidget(
//           lineColor: AppColors.blue,
//           tileColor: AppColors.blue,
//           title: 'vArmor',
//           subtitle: 'Elevated Security for SMCs',
//           licenses: 'Licenses: A3, F3, Business, Standard, MES',
//           features: [
//             '24x5 Alert Monitoring, Incident Response',
//             'AI-Powered Reporting',
//             'Incident Support',
//             'Dashboard',
//             'VIP monitoring',
//             'UEBA for IT, AI-powered SOAR',
//             'vProtect, and SIEM',
//             'Response, Threat-Hunting',
//           ],
//         ),
//         const BuildSolutionCardWidget(
//           lineColor: AppColors.grey,
//           tileColor: AppColors.grey,
//           title: 'vFortify',
//           subtitle: 'Comprehensive Security for Enterprise',
//           licenses: 'Licenses: A6, F5, Business, Premium, MES, Sentinel',
//           features: [
//             'vProtect, and SIEM',
//             'UEBA for IT, AI-powered SOAR',
//             'VIP monitoring',
//             'Dashboard',
//             'AI-Powered',
//             'UEBA for IT, AI-powered SOAR',
//             'vProtect, and SIEM',
//             'Response, Threat-Hunting',
//           ],
//         ),
//         BuildSolutionCardWidget(
//           lineColor: AppColors.blue.withOpacity(0.7),
//           tileColor: AppColors.blue.withOpacity(0.7),
//           title: 'vProtect',
//           subtitle: 'Enhanced Security for SMEs',
//           licenses: 'Licenses: A5, F5, Business, Premium, MES',
//           features: const [
//             '24x7 Monitoring,Advanced Response,Threat-Hunting',
//             'AI-Powered',
//             'Dashboard',
//             'UEBA for IT, AI-powered SOAR',
//             'vProtect, and SIEM',
//           ],
//         ),
//       ].map((card) => Expanded(child: card)).toList(),
//     );
//   }

Text titleText() {
  return const Text(
    "Solutions Comparison",
    style: TextStyle(
      color: Color.fromARGB(255, 6, 42, 71),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

//   Widget _buildSolutionCard({
//     required String title,
//     required String subtitle,
//     required String licenses,
//     required Color tileColor,
//     required List<String> features,
//     required Color lineColor,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         padding: const EdgeInsets.all(
//           15,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 20,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         height: 450,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       width: Constants.width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: tileColor,
//                       ),
//                       height: 120,
//                       child: Center(
//                         child: Kstyles().light(
//                           text: title,
//                           color: AppColors.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                     const Gap(10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         LineWithCircle(
//                           circleColor: lineColor,
//                           circleRadius: 5,
//                           lineWidth: 80,
//                           lineColor: lineColor,
//                         ),
//                         LineWithCircle(
//                           circleColor: lineColor,
//                           circleRadius: 5,
//                           lineWidth: 80,
//                           lineColor: lineColor,
//                           isReversed: true,
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 Positioned(
//                   right: 20,
//                   left: 20,
//                   bottom: -5,
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(boxShadow: [
//                       BoxShadow(
//                         blurRadius: 10,
//                         color: AppColors.grey.withOpacity(0.2),
//                         offset: const Offset(0, 3),
//                         spreadRadius: 10,
//                       )
//                     ], shape: BoxShape.circle, color: Colors.white),
//                     child: const Center(
//                       child: Text(
//                         "3",
//                         style: TextStyle(fontSize: 15),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const Gap(30),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//             const SizedBox(height: 5),
//             Text(
//               licenses,
//               style: const TextStyle(
//                 fontSize: 10,
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'Features:',
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//             const SizedBox(height: 5),
//             Expanded(
//               child: ListView.separated(
//                 padding: const EdgeInsets.all(10),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) =>
//                     CustomTextWidget(text: features[index]),
//                 separatorBuilder: (context, index) => const Gap(10),
//                 itemCount: features.length,
//               ),
//             ),
//             const Gap(15),
//             const Center(
//               child: CustomAnimatedButton(
//                 bgButtonColor: AppColors.darkOrangeColor,
//                 text: 'Contact Us',
//                 buttonWidth: 120,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

