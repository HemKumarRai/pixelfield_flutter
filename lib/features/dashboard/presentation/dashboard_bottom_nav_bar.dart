import 'package:flutter/material.dart';
import 'package:pixelfield/utils/colors/colors.dart';
import 'package:pixelfield/utils/images/images_utils.dart';

import '../data/model/navigation_item_model.dart';

class DashBoardBottomNavBar extends StatefulWidget {
  const DashBoardBottomNavBar(
      {super.key, this.onTap, this.iconSize = 24.0, this.initialIndex = 0})
      : assert(iconSize >= 0.0);

  final ValueChanged<int>? onTap;
  final double iconSize;
  final int initialIndex;

  @override
  State<DashBoardBottomNavBar> createState() => _DashBoardBottomNavBarState();
}

class _DashBoardBottomNavBarState extends State<DashBoardBottomNavBar> {
  int selectedIndex = 0;
  final icons = [
    NavigationItemModel(id: "Scan", image: ImagesUtils.scanImage),
    NavigationItemModel(id: "Collection", image: ImagesUtils.collectionImage),
    NavigationItemModel(id: "Shop", image: ImagesUtils.shopImage),
    NavigationItemModel(id: "Settings", image: ImagesUtils.settingImage),
  ];

  @override
  void initState() {
    // TODO: implement initState
    if (widget.initialIndex != 0) {
      selectedIndex = widget.initialIndex;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: ColorUtils.darkCardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(2.0),
          topRight: Radius.circular(2.0),
        ),
        boxShadow: [
          const BoxShadow(
            offset: Offset(0, -0.89),
            blurRadius: 8.04,
            spreadRadius: 0.0,
          ),
          BoxShadow(
              offset: const Offset(0, -1),
              blurRadius: 36,
              spreadRadius: 0.0,
              color:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8)),
        ],
      ),
      constraints: const BoxConstraints(minHeight: kBottomNavigationBarHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: icons
            .map(
              (icon) => Expanded(
                child: GestureDetector(
                  child: _NavigationItem(
                    isSelected: selectedIndex == icons.indexOf(icon),
                    navigationItemModel: icon,
                  ),
                  onTap: () {
                    if (widget.onTap != null) {
                      setState(() {
                        selectedIndex = icons.indexOf(icon);
                        widget.onTap!(selectedIndex);
                      });
                    }
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem(
      {required this.navigationItemModel, required this.isSelected});

  final NavigationItemModel navigationItemModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    Widget shadowText = Container();
    shadowText = Text(
      navigationItemModel.id,
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: isSelected ? Colors.white : Colors.grey),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          navigationItemModel.image,
          width: 24,
          color: isSelected ? Colors.white : Colors.grey,
          height: 24,
        ),
        shadowText,
      ],
    );
  }
}
