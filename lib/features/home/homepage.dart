import 'package:flutter/material.dart';
import 'package:flutter_poc/shared/utils/responsive_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Welcome to the Homepage!', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 20),
        _buildCard(),
        _buildCard(),
        _buildCard(),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Center(
      child: SizedBox(
        width: 500,
        child: _buildMobileLayout(),
      ),
    );
  }

  Widget _buildWebLayout() {
    return Center(
      child: SizedBox(
        width: 800,
        child: _buildMobileLayout(),
      ),
    );
  }

  Widget _buildCard() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('This is a dummy card', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
