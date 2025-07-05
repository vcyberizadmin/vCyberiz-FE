import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class StackedCardList extends StatefulWidget {
  @override
  _StackedCardListState createState() => _StackedCardListState();
}

class _StackedCardListState extends State<StackedCardList> {
  late ScrollController _scrollController;
  List<CardData> _cardData = []; // Initial card data
  int _nextCardIndex = 0; // Index for adding new cards

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _initializeCardData(); // Initialize the initial cards
  }

  void _initializeCardData() {
    // Replace this with your actual data fetching or generation
    for (int i = 0; i < 5; i++) {
      _cardData.add(CardData(
          title: 'Card ${i + 1}', content: 'Content for card ${i + 1}'));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _addCard() {
    if (_nextCardIndex < 10) {
      // Limit to a maximum of 10 cards for example
      setState(() {
        _cardData.add(CardData(
          title: 'Card ${_nextCardIndex + 1}',
          content: 'Content for card ${_nextCardIndex + 1}',
        ));
        _nextCardIndex++;
      });
    }
  }

  void _removeTopCard() {
    if (_cardData.isNotEmpty) {
      setState(() {
        _cardData.removeAt(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 800,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            if (_scrollController.position.userScrollDirection ==
                ScrollDirection.reverse) {
              // Scrolling up, add a new card
              _addCard();
            } else if (_scrollController.position.userScrollDirection ==
                ScrollDirection.forward) {
              // Scrolling down, remove the top card
              _removeTopCard();
            }
          }
          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _cardData.length + 1, // Add 1 for the "Add Card" button
          itemBuilder: (context, index) {
            if (index < _cardData.length) {
              final card = _cardData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  color: AppColors.white,
                  child: Column(
                    children: [
                      Text(card.title),
                      Text(card.content),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: TextButton(
                  onPressed: _addCard,
                  child: Text('Add Card'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class CardData {
  final String title;
  final String content;

  CardData({required this.title, required this.content});
}
