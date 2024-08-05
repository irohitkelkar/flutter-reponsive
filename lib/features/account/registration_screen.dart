import 'package:flutter/material.dart';
import 'package:flutter_poc/shared/utils/responsive_widget.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        web: _buildWebLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.jpg', height: 100),
          const SizedBox(height: 20),
          _buildRegistrationForm(context),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg', height: 100),
            const SizedBox(height: 20),
            _buildRegistrationForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.jpg', height: 200),
                const SizedBox(width: 20),
                Expanded(child: _buildRegistrationForm(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Log in to Traders', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 10),
        const TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Mobile Number',
            hintText: 'Enter your mobile number',
            prefixIcon: Icon(Icons.phone), // Optional icon
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: Icon(Icons.remove_red_eye), // Optional icon
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Navigate to the homepage
            GoRouter.of(context).go('/chat');
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
