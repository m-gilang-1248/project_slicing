import 'package:flutter/material.dart';
import 'dart:math';

class ProfilePage extends StatelessWidget {
  final List<String> unsplashHighlights = [
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
  ];
  final List<String> unsplashGrid = [
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
    'https://images.unsplash.com/photo-1517841905240-472988babdf9',
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
    'https://images.unsplash.com/photo-1463453091185-61582044d556',
    'https://images.unsplash.com/photo-1465101178521-c1a9136a3b99',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gilang_kf'),
        actions: [Icon(Icons.menu)],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: CircleAvatar(radius: 40, backgroundColor: Colors.grey[300], backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                    ),),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat('54', 'Posts'),
                    _buildStat('834', 'Followers'),
                    _buildStat('162', 'Following'),
                  ],
                ),
              ),
            ],
          ),
          Text('M. Gilang M.W. Sabdokafi\n221240001248\nTIFA.'),
          SizedBox(height: 8),
          ElevatedButton(onPressed: () {}, child: Text('Edit Profile')),
          // Highlights
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(unsplashHighlights.length, (index) => _buildHighlight('Highlight', unsplashHighlights[index])),
            ),
          ),
          // Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(unsplashGrid.length, (index) => Container(
                margin: EdgeInsets.all(2),
                child: Image.network(
                  unsplashGrid[index % unsplashGrid.length],
                  fit: BoxFit.cover,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label),
      ],
    );
  }

  Widget _buildHighlight(String label, String imageUrl) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(radius: 24, backgroundImage: NetworkImage(imageUrl)),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}