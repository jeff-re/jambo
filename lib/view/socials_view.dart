import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialHandlesPage extends StatelessWidget {
  const SocialHandlesPage({super.key});

  // Define the URLs for the social media platforms
  final String facebookUrl = 'https://www.facebook.com/your_page';
  final String twitterUrl = 'https://twitter.com/your_handle';
  final String instagramUrl = 'https://www.instagram.com/your_profile';
  final String youtubeUrl = 'https://www.youtube.com/your_channel';

  // Function to launch URLs
  Future<void> _launchUrl(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/3721941/pexels-photo-3721941.jpeg?auto=compress&cs=tinysrgb&w=600'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Facebook button
                ElevatedButton.icon(
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  label: const Text('Facebook'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () => _launchUrl(facebookUrl),
                ),
                const SizedBox(height: 20),

                // Twitter button
                ElevatedButton.icon(
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  label: const Text('Twitter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () => _launchUrl(twitterUrl),
                ),
                const SizedBox(height: 20),

                // Instagram button
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  label: const Text('Instagram'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () => _launchUrl(instagramUrl),
                ),
                const SizedBox(height: 20),

                // YouTube button
                ElevatedButton.icon(
                  icon: const Icon(Icons.video_library, color: Colors.white),
                  label: const Text('YouTube'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () => _launchUrl(youtubeUrl),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Handles',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const SocialHandlesPage(),
    );
  }
}
