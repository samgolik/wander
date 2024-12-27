import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wander/model/category.dart';
import 'package:wander/firebase_options.dart';
import 'package:wander/screens/category_screen.dart';
import 'package:wander/screens/home_screen.dart';
import 'package:wander/screens/login_screen.dart';
import 'package:wander/screens/profile_screen.dart';
import 'package:wander/screens/register_screen.dart';
import 'package:wander/screens/temporary_screen.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthHandler(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/temporary': (context) => TemporaryScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/category') {
          final Category category = settings.arguments as Category;
          return MaterialPageRoute(
            builder: (context) => CategoryScreen(
                category: category,
                userId: FirebaseAuth.instance.currentUser!.uid),
          );
        }
        return null;
      },
    );
  }
}

class AuthHandler extends StatelessWidget {
  const AuthHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, authSnapshot) {
              if (authSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (authSnapshot.hasData) {
                return const HomeScreen(); // User is logged in
              } else {
                return LoginScreen(); // User is not logged in
              }
            },
          );
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error initializing Firebase'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}


// class TravelListPage extends StatefulWidget {
//   final String categoryName;
//   final List<String> destinations;

//   TravelListPage({required this.categoryName, required this.destinations});

//   @override
//   _TravelListPageState createState() => _TravelListPageState();
// }

// class _TravelListPageState extends State<TravelListPage> {
//   late List<bool> visited;

//   @override
//   void initState() {
//     super.initState();
//     visited = List<bool>.filled(widget.destinations.length, false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.categoryName),
//       ),
//       body: ListView.builder(
//         itemCount: widget.destinations.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Checkbox(
//               value: visited[index],
//               onChanged: (value) {
//                 setState(() {
//                   visited[index] = value!;
//                 });
//               },
//             ),
//             title: Text(widget.destinations[index]),
//           );
//         },
//       ),
//     );
//   }
// }

// Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: Scaffold(
    //     body: Stack(
    //       children: [
    //         FlutterMap(
    //           options: const MapOptions(
    //             initialCenter: LatLng(51.509364, -0.128928),
    //             initialZoom: 3.2,
    //           ),
    //           children: [
    //             TileLayer(
    //               urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    //               userAgentPackageName: 'com.example.app',
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );