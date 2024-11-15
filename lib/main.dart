import 'package:flutter/material.dart';

void main() {
  runApp(const RailwayNavigationApp());
}

class RailwayNavigationApp extends StatelessWidget {
  const RailwayNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Railway Navigation',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        fontFamily: 'CourierPrime',
      ),
      home: const NavigationMainPage(),
    );
  }
}

// Main Page with Navigation Bar
class NavigationMainPage extends StatefulWidget {
  const NavigationMainPage({super.key});

  @override
  _NavigationMainPageState createState() => _NavigationMainPageState();
}

class _NavigationMainPageState extends State<NavigationMainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const WelcomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Welcome Page
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Railway Navigator", style: TextStyle(fontFamily: 'CourierPrime')),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // Implement language change functionality here
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'नमस्ते',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'CourierPrime',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome to Railway Navigator',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'CourierPrime',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Select Station',
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                prefixIcon: Icon(Icons.train, color: Colors.deepPurpleAccent),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Platform Number',
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                prefixIcon: Icon(Icons.directions_railway, color: Colors.deepPurpleAccent), // Changed icon
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                // Implement start navigation functionality
              },
              child: const Text(
                'Start Navigation',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CourierPrime',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.report_problem, color: Colors.redAccent),
                  onPressed: () {
                    // Navigate to complaint registration
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.greenAccent),
                  onPressed: () {
                    // Show more options
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Search Page with Clickable Options
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Search Nearby", style: TextStyle(fontFamily: 'CourierPrime')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Find Nearby Facilities',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'CourierPrime',
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildSearchOption(
                    context: context,
                    icon: Icons.hotel,
                    label: 'Hotels',
                    color: Colors.blueGrey,
                  ),
                  _buildSearchOption(
                    context: context,
                    icon: Icons.nature_people,
                    label: 'Picnic Spots',
                    color: Colors.teal,
                  ),
                  _buildSearchOption(
                    context: context,
                    icon: Icons.shopping_cart,
                    label: 'Shopping',
                    color: Colors.purple,
                  ),
                  _buildSearchOption(
                    context: context,
                    icon: Icons.restaurant,
                    label: 'Restaurants',
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchResultPage(label)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'CourierPrime',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder Page for Search Results
class SearchResultPage extends StatelessWidget {
  final String label;
  const SearchResultPage(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("$label Results", style: const TextStyle(fontFamily: 'CourierPrime')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Results for $label',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'CourierPrime',
          ),
        ),
      ),
    );
  }
}

// Profile Page with Login Button
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontFamily: 'CourierPrime')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CourierPrime',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CourierPrime',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(fontFamily: 'CourierPrime')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign in to your account',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CourierPrime',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email, color: Colors.deepPurpleAccent),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.deepPurpleAccent),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {},
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sign Up Page
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(fontFamily: 'CourierPrime')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person, color: Colors.deepPurpleAccent),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email, color: Colors.deepPurpleAccent),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone, color: Colors.deepPurpleAccent),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.deepPurpleAccent),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.deepPurpleAccent),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {},
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

