import 'package:flutter/material.dart';
import 'package:pixelfield/features/collection/presentation/collection_screen.dart';
import 'package:pixelfield/features/dashboard/presentation/dashboard_bottom_nav_bar.dart';



class DashBoardScreen extends StatefulWidget {
  final int? initialIndex;
  const DashBoardScreen({super.key,this.initialIndex});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> with SingleTickerProviderStateMixin{
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this,initialIndex: widget.initialIndex??0);
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: const [
          Center(child: Text("DashBoard")),
          CollectionHomeScreen(),
          Center(child: Text("Shop")),
          Center(child: Text("Setting")),
        ],
      ),
      bottomNavigationBar: DashBoardBottomNavBar(
        initialIndex: widget.initialIndex??0,
        onTap: (index) {
          _controller.animateTo(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
          setState(() {

          });
        },
      ),
    );
  }
}
