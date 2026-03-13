import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF4CAF50),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Alex Johnson',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'Skill Level: 3.8',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Message functionality
              },
              icon: const Icon(Icons.message),
              label: const Text('Message'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Player Stats',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: const [
                _StatCard(
                  title: 'Games Played',
                  value: '47',
                  icon: Icons.sports_baseball,
                ),
                _StatCard(
                  title: 'Wins',
                  value: '32',
                  icon: Icons.emoji_events,
                ),
                _StatCard(
                  title: 'Win Rate',
                  value: '68%',
                  icon: Icons.trending_up,
                ),
                _StatCard(
                  title: 'Best Streak',
                  value: '7',
                  icon: Icons.local_fire_department,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Recent Achievements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const _AchievementCard(
              title: 'First Win',
              description: 'Won your first game',
              date: '2 weeks ago',
            ),
            const _AchievementCard(
              title: '5-Game Streak',
              description: 'Won 5 games in a row',
              date: '1 week ago',
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: const Color(0xFF4CAF50),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4CAF50),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({
    required this.title,
    required this.description,
    required this.date,
  });

  final String title;
  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(
          Icons.star,
          color: Color(0xFF4CAF50),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(description),
        trailing: Text(
          date,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}