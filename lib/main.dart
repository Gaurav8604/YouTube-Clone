import 'package:flutter/material.dart';
import 'package:youtube_clone/routes.dart';
import 'package:youtube_clone/shorts.dart';
import 'package:youtube_clone/youtube_shorts_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.transparent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
      routes: {
        '/home/': (context) => const HomePage(),
        '/shorts/': (context) => const ShortsView(),
        '/subscriptions/': (context) => const ShortsView(),
        '/library/': (context) => const ShortsView(),
        '/screencast/': (context) => const ShortsView(),
        '/notifications/': (context) => const ShortsView(),
        '/search/': (context) => const ShortsView(),
        '/account/': (context) => const ShortsView(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cIndex = 0;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          'assets/images/ytlogo.png',
        ),
        leadingWidth: 60,
        title: Text("YouTube",
            style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast_outlined),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
            iconSize: 30,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [thumbnail, title],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 10,
            thickness: 1,
            color: Colors.grey,
          );
        },
      ),
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
          if (index == 1) Navigator.of(context).pushNamed(shortsRoute);
        },
      ),
    );
  }
}

final Widget thumbnail = Container(
  width: 400,
  height: 160,
  color: Colors.teal,
  child: Image.asset('assets/images/flutter.png'),
);
const Widget title = ListTile(
  leading: Icon(
    Icons.account_circle,
    size: 45,
  ),
  title: Text("Title Here", style: TextStyle(fontSize: 18)),
  subtitle: Text(
    "Subtitle Here",
    style: TextStyle(fontSize: 12),
  ),
);
