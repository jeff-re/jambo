import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeView extends StatefulWidget {
  const YouTubeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _YoutubeViewState createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YouTubeView> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'dQw4w9WgXcQ', // Replace with your initial video ID
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  final List<String> _videoIds = [
    'dQw4w9WgXcQ',
    'C0DPdy98e4c',
    '9bZkp7q19f0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Channel'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFkaW98ZW58MHx8MHx8fDA%3D', // Replace with your background image URL
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _videoIds.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        icon: const Icon(
                          Icons.play_circle_filled,
                          color: Colors.red,
                        ),
                        label: Text(
                          'Play Video ${index + 1}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        onPressed: () {
                          _controller.load(_videoIds[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
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
      title: 'YouTube Channel',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const YouTubeView(),
    );
  }
}
