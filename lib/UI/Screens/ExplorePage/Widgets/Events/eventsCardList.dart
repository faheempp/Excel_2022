import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Components/tabs.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/allEvents.dart';
import 'package:flutter/material.dart';

class EventsCardList extends StatefulWidget {
  @override
  State<EventsCardList> createState() => _EventsCardListState();
  final String selectedTab;
  const EventsCardList({Key key, this.selectedTab}) : super(key: key);
}

class _EventsCardListState extends State<EventsCardList>
    with SingleTickerProviderStateMixin {
  String selectedCategory;
  List<String> tabs = ["All", "Workshops", "Talks", "General"];

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedTab ?? "all";
  }

  @override
  Widget build(BuildContext context) {
    print(selectedCategory);
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: tabs
                    .map((tabItem) => FilterTab(
                          isSelected: selectedCategory == tabItem.toLowerCase(),
                          text: tabItem,
                          onPressed: () {
                            setState(() {
                              selectedCategory = tabItem.toLowerCase();
                            });
                          },
                        ))
                    .toList()),
          ),
          SizedBox(height: 10),
          Flexible(
            child: AllEvents(category: selectedCategory),
          ),
        ],
      ),
    );
  }
}
