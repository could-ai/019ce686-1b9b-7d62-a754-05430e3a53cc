import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FindCourtScreen extends StatefulWidget {
  const FindCourtScreen({super.key});

  @override
  State<FindCourtScreen> createState() => _FindCourtScreenState();
}

class _FindCourtScreenState extends State<FindCourtScreen> {
  final MapController _mapController = MapController();
  double _selectedSkillLevel = 3.0;
  String _selectedCourtType = 'All';

  final List<Map<String, dynamic>> _courts = [
    {
      'name': 'Central Park Courts',
      'lat': 40.7829,
      'lng': -73.9654,
      'skillLevel': 3.5,
      'type': 'Outdoor',
      'address': 'Central Park, New York, NY',
    },
    {
      'name': 'Downtown Sports Center',
      'lat': 40.7505,
      'lng': -73.9934,
      'skillLevel': 4.0,
      'type': 'Indoor',
      'address': '123 Main St, New York, NY',
    },
    {
      'name': 'Riverside Courts',
      'lat': 40.7614,
      'lng': -73.9776,
      'skillLevel': 2.5,
      'type': 'Outdoor',
      'address': 'Riverside Park, New York, NY',
    },
  ];

  List<Map<String, dynamic>> get _filteredCourts {
    return _courts.where((court) {
      final skillMatch = court['skillLevel'] >= _selectedSkillLevel - 0.5 &&
          court['skillLevel'] <= _selectedSkillLevel + 0.5;
      final typeMatch = _selectedCourtType == 'All' || court['type'] == _selectedCourtType;
      return skillMatch && typeMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Court'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: FlutterMap(
              mapController: _mapController,
              options: const MapOptions(
                initialCenter: LatLng(40.7128, -74.0060),
                initialZoom: 12.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: _filteredCourts.map((court) {
                    return Marker(
                      point: LatLng(court['lat'], court['lng']),
                      child: const Icon(
                        Icons.sports_baseball,
                        color: Color(0xFF4CAF50),
                        size: 30,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: _filteredCourts.length,
              itemBuilder: (context, index) {
                final court = _filteredCourts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.sports_baseball,
                      color: Color(0xFF4CAF50),
                    ),
                    title: Text(
                      court['name'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '${court['address']}\nSkill Level: ${court['skillLevel']} • ${court['type']}',
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Navigate to court details
                      },
                      child: const Text('View'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Courts'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Skill Level Range'),
            Slider(
              value: _selectedSkillLevel,
              min: 2.0,
              max: 5.0,
              divisions: 6,
              label: _selectedSkillLevel.toString(),
              onChanged: (value) {
                setState(() {
                  _selectedSkillLevel = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Court Type'),
            DropdownButton<String>(
              value: _selectedCourtType,
              items: const [
                DropdownMenuItem(value: 'All', child: Text('All')),
                DropdownMenuItem(value: 'Indoor', child: Text('Indoor')),
                DropdownMenuItem(value: 'Outdoor', child: Text('Outdoor')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedCourtType = value!;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}