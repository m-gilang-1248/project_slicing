import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> unsplashStories = [
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
    'https://images.unsplash.com/photo-1517841905240-472988babdf9',
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
    'https://images.unsplash.com/photo-1463453091185-61582044d556',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Navigasi ke halaman lain jika perlu
      if (index == 4) {
        Navigator.pushNamed(context, '/profile');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram', style: TextStyle(fontFamily: 'Billabong', fontSize: 32)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.send), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          // Stories
          Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: unsplashStories.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(
                    unsplashStories[index % unsplashStories.length],
                  ),
                ),
              ),
            ),
          ),
          // Feed
          Card(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                    ),
                  ),
                  title: Text('gilang_kf'),
                  subtitle: Text('Jepara, Indonesia'),
                  trailing: Icon(Icons.more_vert),
                ),
                Image.network('https://images.unsplash.com/photo-1746457256184-9a93292b1765?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Amazing shot on Fujifilm XT edited with Lightroom'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'
                    ),
                  ),
                  title: Text('joshua_l'),
                  subtitle: Text('Tokyo, Japan'),
                  trailing: Icon(Icons.more_vert),
                ),
                Image.network('https://images.unsplash.com/photo-1506744038136-46273834b3fb'),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF3797EF),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.search, 1),
          _buildNavItem(Icons.add_box, 2),
          _buildNavItem(Icons.favorite_border, 3),
          _buildNavItem(Icons.person, 4, isProfile: true),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index, {bool isProfile = false}) {
    return BottomNavigationBarItem(
      icon: AnimatedScale(
        scale: _selectedIndex == index ? 1.2 : 1.0,
        duration: Duration(milliseconds: 200),
        child: isProfile
            ? CircleAvatar(
                radius: 12,
                backgroundColor: _selectedIndex == index ? Color(0xFF3797EF) : Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 16),
              )
            : Icon(icon),
      ),
      label: '',
    );
  }
}