import 'package:flutter/material.dart';
import 'package:flutter_poc/responsive_widget.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
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
          Text('Account Details', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Text('Name: John Doe', style: TextStyle(fontSize: 18)),
          Text('Email: john.doe@example.com', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: Text('Logout')),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        child: _buildMobileLayout(context),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        child: _buildMobileLayout(context),
      ),
    );
  }
}
