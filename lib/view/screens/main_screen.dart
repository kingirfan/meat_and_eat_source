import 'package:flutter/material.dart';
import 'package:meat_and_eat/utils/theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/shop.png',
            ),
          ),
        ],
        title: const Text('Shop'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('Main Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: mainColor,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.category,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.category,
                  color: mainColor,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                  color: mainColor,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: mainColor,
                )),
          ]),
    );
  }
}
