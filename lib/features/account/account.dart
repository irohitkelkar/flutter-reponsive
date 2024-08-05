import 'package:flutter/material.dart';
import 'package:flutter_poc/shared/utils/responsive_widget.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      web: _buildWebLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Account Details', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          const Text('Name: John Doe', style: TextStyle(fontSize: 18)),
          const Text('Email: john.doe@example.com',
              style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: const Text('Logout')),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: _buildMobileLayout(context),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 800,
        child: _buildMobileLayout(context),
      ),
    );
  }
}
