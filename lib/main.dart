import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/about_view.dart';
import 'package:flutter_application_1/view/home_view.dart';
import 'package:flutter_application_1/view/privacy_view.dart';
import 'package:flutter_application_1/view/rateus_view.dart';
import 'package:flutter_application_1/view/socials_view.dart';
import 'package:flutter_application_1/view/youtube_view.dart';



class BasePage extends StatefulWidget {
  final Widget body;
  final String title;

  const BasePage({super.key, required this.body, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
        
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Radio Moja',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'Kilele cha Mambo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFkaW98ZW58MHx8MHx8fDA%3D',
                  ),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2017/11/11/18/31/music-player-2939936_1280.jpg',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BasePage(body: HomeView(), title: 'Home')),
                );
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.youtube_searched_for),
            //   title: const Text('Youtube'),
            //   onTap: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => const BasePage(body: YouTubeView(), title: 'Youtube')),
            //     );
            //   },
            // ),
             ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BasePage(body: PrivacyPolicyView(), title: 'Profile')),
                );
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BasePage(body: AboutView(), title: 'About')),
                );
              },
            ),
             ListTile(
              leading: const Icon(Icons.amp_stories),
              title: const Text('Social'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BasePage(body: SocialHandlesPage(), title: 'Social')),
                );
              },
            ),
             ListTile(
              leading: const Icon(Icons.rate_review_sharp),
              title: const Text('Rate Us'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BasePage(body: RateUsPage(), title: 'Rate Us')),
                );
              },
            ),
          ],
        ),
      ),
      body: widget.body,
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
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasePage(body: HomeView(), title: 'Home'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Page'));
  }
}

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Youtube Page'));
//   }
// }
class Privacypage extends StatelessWidget {
  const Privacypage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Privacy Page'));
  }
}
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('About Page'));
  }
}
class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Social Page'));
  }
}
class RatePage extends StatelessWidget {
  const RatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Rate Us Page'));
  }
}
