import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vcyberiz/data/model/our_service_model/service_offerrings_model.dart';

class EqualHeightWrap extends StatefulWidget {
  final List<SecCard> items;
  final Widget Function(SecCard item, double? height) buildCard;

  const EqualHeightWrap({
    required this.items,
    required this.buildCard,
  });

  @override
  State<EqualHeightWrap> createState() => _EqualHeightWrapState();
}

class _EqualHeightWrapState extends State<EqualHeightWrap> {
  final List<GlobalKey> _keys = [];
  double _maxHeight = 0;

  @override
  void initState() {
    super.initState();
    _keys.addAll(widget.items.map((e) => GlobalKey()).toList());

    WidgetsBinding.instance.addPostFrameCallback((_) => _calculateHeight());
  }

  void _calculateHeight() {
    double maxH = 0;
    for (final key in _keys) {
      final ctx = key.currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        maxH = max(maxH, box.size.height);
      }
    }
    if (maxH != _maxHeight) {
      setState(() {
        _maxHeight = maxH + 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 50,
      runSpacing: 20,
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        return Container(
          key: _keys[index],
          child: widget.buildCard(item, _maxHeight > 0 ? _maxHeight : null),
        );
      }),
    );
  }
}
