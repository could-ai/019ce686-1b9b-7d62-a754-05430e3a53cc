import 'package:flutter/material.dart';

class MatchmakingScreen extends StatefulWidget {
  const MatchmakingScreen({super.key});

  @override
  State<MatchmakingScreen> createState() => _MatchmakingScreenState();
}

class _MatchmakingScreenState extends State<MatchmakingScreen> {
  final List<Map<String, dynamic>> _games = [
    {
      'host': 'John Doe',
      'skillLevel': 4.0,
      'court': 'Central Park Courts',
      'dateTime': 'Today, 3:00 PM',
      'players': 2,
      'maxPlayers': 4,
      'type': 'Casual',
    },
    {
      'host': 'Jane Smith',
      'skillLevel': 3.5,
      'court': 'Downtown Sports Center',
      'dateTime': 'Tomorrow, 10:00 AM',
      'players': 3,
      'maxPlayers': 4,
      'type': 'Competitive',
    },
    {
      'host': 'Mike Johnson',
      'skillLevel': 2.8,
      'court': 'Riverside Courts',
      'dateTime': 'Friday, 6:00 PM',
      'players': 1,
      'maxPlayers': 4,
      'type': 'Casual',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matchmaking'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Host new game
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _games.length,
        itemBuilder: (context, index) {
          final game = _games[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        game['host'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: game['type'] == 'Competitive'
                              ? Colors.red.withOpacity(0.1)
                              : Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          game['type'],
                          style: TextStyle(
                            color: game['type'] == 'Competitive' ? Colors.red : Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Skill Level: ${game['skillLevel']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Court: ${game['court']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    game['dateTime'],
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Players: ${game['players']}/${game['maxPlayers']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: game['players'] < game['maxPlayers']
                            ? () {
                                setState(() {
                                  _games[index]['players']++;
                                });
                              }
                            : null,
                        child: const Text('Join Game'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Host new game
        },
        backgroundColor: const Color(0xFF4CAF50),
        child: const Icon(Icons.add),
      ),
    );
  }
}