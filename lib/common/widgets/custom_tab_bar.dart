import 'package:flutter/material.dart';
import 'package:pixelfield/utils/colors/colors.dart';

class CustomTabs extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> indexedView;

  const CustomTabs({super.key, required this.tabs, required this.indexedView})
      : assert(tabs.length == indexedView.length,
            'tabs and indexedView must have the same length');

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Column(
        children: [
          Container(
            height: 32,
            decoration: BoxDecoration(
              color: ColorUtils.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: List.generate(
                widget.tabs.length,
                (index) => _buildTab(
                    widget.tabs[index], _tabController.index == index),
              ),
              onTap: (index) {
                setState(() {}); // Triggers animation
              },
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Center(child: [...widget.indexedView][_tabController.index]),
        ],
      ),
    );
  }

  Widget _buildTab(String item, bool selected) {
    return AnimatedContainer(
      height: 32,
      width: double.infinity,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: selected ? ColorUtils.buttonColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: selected
                ? ColorUtils.blackTextColor
                : ColorUtils.greyScale3Color),
        child: Text(item),
      ),
    );
  }
}
