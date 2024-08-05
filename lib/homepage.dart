import 'package:flutter/material.dart';
import 'package:flutter_poc/responsive_widget.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      web: _buildWebLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text('Welcome to the Homepage!', style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        _buildCard(),
        _buildCard(),
        _buildCard(),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Center(
      child: Container(
        width: 500,
        child: _buildMobileLayout(),
      ),
    );
  }

  Widget _buildWebLayout() {
    return Center(
      child: Container(
        width: 800,
        child: _buildMobileLayout(),
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('This is a dummy card', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
