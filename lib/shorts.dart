import 'package:flutter/material.dart';
import 'package:youtube_clone/routes.dart';
import 'package:youtube_clone/youtube_shorts_icons.dart';

class ShortsView extends StatefulWidget {
  const ShortsView({Key? key}) : super(key: key);

  @override
  State<ShortsView> createState() => _ShortsViewState();
}

class _ShortsViewState extends State<ShortsView> {
  int _cIndex = 1;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("\n\n\nOla Uber"),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _cIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(YoutubeShorts.shorts),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 45),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: 'Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_sharp),
            label: 'Library',
          ),
        ],
        onTap: (index) {
          _incrementTab(index);
          if (index == 0) Navigator.of(context).pushNamed(homeRoute);
        },
      ),
    );
  }
}
