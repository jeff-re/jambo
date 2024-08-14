//import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:audio_session/audio_session.dart';
import 'package:text_marquee/text_marquee.dart';
import 'dart:async'; // Import for Timer

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  Timer? _timer; // Timer variable to manage the countdown

  @override
  void initState() {
    super.initState();
    _initializeAudioSession();
    _audioPlayer = AudioPlayer();

    _audioPlayer.durationStream.listen((Duration? d) {
      setState(() {
        _duration = d ?? Duration.zero;
      });
    });

    _audioPlayer.positionStream.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
  }

  Future<void> _initializeAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _timer?.cancel(); // Cancel the timer if it's active
    super.dispose();
  }

  void _playPause() async {
    final session = await AudioSession.instance;
    if (_isPlaying) {
      await _audioPlayer.pause();
      session.setActive(false);
      _timer?.cancel(); // Cancel the timer if audio is paused
      setState(() {
        _isPlaying = false;
      });
    } else {
      await session.setActive(true);
      await _audioPlayer.setUrl('https://stream.zeno.fm/j6f2mxfg169vv');
      await _audioPlayer.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _setTimer(Duration duration) {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer(duration, () {
      _audioPlayer.stop();
      setState(() {
        _isPlaying = false;
      });
    });
  }

  void _showTimerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Set Timer'),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _setTimer(const Duration(minutes: 5));
                    Navigator.pop(context);
                  },
                  child: const Text('5 Minutes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setTimer(const Duration(minutes: 10));
                    Navigator.pop(context);
                  },
                  child: const Text('10 Minutes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setTimer(const Duration(minutes: 15));
                    Navigator.pop(context);
                  },
                  child: const Text('15 Minutes'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/3721941/pexels-photo-3721941.jpeg?auto=compress&cs=tinysrgb&w=600'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2017/11/11/18/31/music-player-2939936_1280.jpg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const TextMarquee(
                  'Radio Jambo Live',
                  spaceSize: 12,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_position),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        _formatDuration(_duration),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.skip_previous, color: Colors.white),
                      onPressed: () {
                        // Add logic for previous
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: _playPause,
                    ),
                    IconButton(
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                      onPressed: () {
                        // Add logic for shuffle
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.white),
                      onPressed: () {
                        // Add logic for next
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showTimerDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: const Text(
                    'Set Timer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Jambo Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
