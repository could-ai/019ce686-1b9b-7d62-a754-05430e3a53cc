import 'package:flutter/material.dart';

class Court {
  final String name;
  final double lat;
  final double lng;
  final double skillLevel;
  final String type;
  final String address;

  Court({
    required this.name,
    required this.lat,
    required this.lng,
    required this.skillLevel,
    required this.type,
    required this.address,
  });
}

class Game {
  final String host;
  final double skillLevel;
  final String court;
  final String dateTime;
  int players;
  final int maxPlayers;
  final String type;

  Game({
    required this.host,
    required this.skillLevel,
    required this.court,
    required this.dateTime,
    required this.players,
    required this.maxPlayers,
    required this.type,
  });
}