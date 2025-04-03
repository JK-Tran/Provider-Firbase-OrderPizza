import 'package:flutter/material.dart';


class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySilverAppBar({super.key,required this.child,required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: 350,
        collapsedHeight: 120,
        floating: false,
        pinned: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text("Thực đơn",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600),),
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: child,
          ),
          title: title,
          centerTitle: true,
          titlePadding: const EdgeInsets.only(left: 0, right: 0,top: 0),
          expandedTitleScale: 1,
        ),
    );
  }
}
