// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class HexagonWidget extends StatelessWidget {
  HexagonWidget({super.key});

  List dataList = [
    {
      'text': 'Discover',
      'color1': AppColors.buttonColor,
      'color2': AppColors.buttonColor.withOpacity(.7),
      'icon': Icons.search,
    },
    {
      'text': 'Assess',
      'color1': AppColors.darkBlueHexagon,
      'color2': AppColors.darkBlueHexagon.withOpacity(.2),
      'icon': Icons.search,
    },
    {
      'text': 'Evaluate',
      'color1': AppColors.buttonColor,
      'color2': AppColors.buttonColor.withOpacity(.2),
      'icon': Icons.search,
    },
    {
      'text': 'Report',
      'color1': AppColors.buttonColor,
      'color2': AppColors.buttonColor.withOpacity(.2),
      'icon': Icons.search,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hexa_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...(dataList).map(
              (data) => HexagonData(
                text: data['text'],
                color1: data['color1'],
                color2: data['color2'],
                icon: data['icon'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final Path path = Path();
    path.moveTo(w * 0.5, 0); // Top center
    path.lineTo(w, h * 0.25); // Top-right
    path.lineTo(w, h * 0.75); // Bottom-right
    path.lineTo(w * 0.5, h); // Bottom center
    path.lineTo(0, h * 0.75); // Bottom-left
    path.lineTo(0, h * 0.25); // Top-left
    path.close(); // Connect back to top center
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HexagonData extends StatefulWidget {
  final String text;
  final Color color1;
  final Color color2;
  final IconData icon;

  const HexagonData(
      {super.key,
      required this.text,
      required this.color1,
      required this.color2,
      required this.icon});

  @override
  State<HexagonData> createState() => _HexagonDataState();
}

class _HexagonDataState extends State<HexagonData>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  bool isHovered = false; // Global hover state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _rotationAnimation =
        Tween<double>(begin: 0, end: pi / 6) // Rotate 30 degrees
            .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
      if (hover) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value,
              child: ClipPath(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                clipper: HexagonClipper(),
                child: Container(
                  width: 150,
                  height: 160,
                  decoration: BoxDecoration(
                    color: AppColors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color:
                            widget.color1.withOpacity(0.1), // Soft shadow color
                        offset: Offset(0, 1), // Offset of the shadow
                        blurRadius: 0, // Blur radius
                        spreadRadius:
                            0, // Spread radius to make the shadow more pronounced
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ClipPath(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      clipper: HexagonClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          // Applying the box shadow to the main container
                          boxShadow: [
                            BoxShadow(
                              color: widget.color1
                                  .withOpacity(0.3), // Soft shadow color
                              offset: Offset(4, 4), // Offset of the shadow
                              blurRadius: 5, // Blur radius
                              spreadRadius:
                                  5, // Spread radius to make the shadow more pronounced
                            ),
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                widget.color1,
                                widget.color2,
                              ]),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipPath(
                            clipper: HexagonClipper(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: ClipPath(
                                  clipper: HexagonClipper(),
                                  child: Container(
                                    color: widget.color1,
                                    child: Center(
                                      child: Transform.rotate(
                                        angle: -_rotationAnimation
                                            .value, // Counter rotation
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              widget.icon,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              widget.text,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
