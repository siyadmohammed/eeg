import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Placeholder image for the profile avatar
              radius: 30,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome'),
                Text('Madona Mary', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          // Scrollable horizontal cards container
          Container(
            height: MediaQuery.of(context).size.height*0.40,
            margin: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildCard('Card 1', HexColor("E8D9EC")),
                const SizedBox(width: 30),
                buildCard('Card 2', HexColor("FBAE84")),
                const SizedBox(width: 30),
                buildCard('Card 3', Colors.green),
              ],
            ),
          ),
          // Static image container
          Container(
            height: 200,
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/waves.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a card widget
  Widget buildCard(String title, Color color) {
    return Container(
      width:MediaQuery.of(context).size.width*0.65,
      height:MediaQuery.of(context).size.height*0.2,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
