import 'package:flutter/material.dart';
import 'package:flutter_poc/shared/utils/responsive_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: LivePrices(),
      tablet: LivePrices(),
      web: LivePrices(),
    );
  }
}

class LivePrices extends StatefulWidget {
  const LivePrices({super.key});

  @override
  State<LivePrices> createState() => _LivePricesState();
}

class _LivePricesState extends State<LivePrices> {
  // Hardcoded commodity data with potential for multiple sellers
  final List<Map<String, String>> commodities = [
    {'name': 'Wheat', 'rate': '250.00', 'seller': 'John Doe Traders'},
    {'name': 'Rice', 'rate': '300.00', 'seller': 'Smith & Co.'},
    {'name': 'Corn', 'rate': '200.00', 'seller': 'Greenfield Supplies'},
    {'name': 'Barley', 'rate': '275.00', 'seller': 'Farmers Market'},
    {'name': 'Oats', 'rate': '180.00', 'seller': 'Harvest Goods'},
    {'name': 'Soybeans', 'rate': '320.00', 'seller': 'AgriTrade Ltd.'},
    {'name': 'Wheat', 'rate': '245.00', 'seller': 'Farmers Hub'},
    {'name': 'Rice', 'rate': '305.00', 'seller': 'Agriculture Ltd.'},
    {'name': 'Corn', 'rate': '210.00', 'seller': 'Greenfield Supplies'},
    {'name': 'Barley', 'rate': '270.00', 'seller': 'Market Vendors'},
    {'name': 'Oats', 'rate': '175.00', 'seller': 'Cereal Distributors'},
    {'name': 'Soybeans', 'rate': '315.00', 'seller': 'Farm & Feed'},
    {'name': 'Wheat', 'rate': '255.00', 'seller': 'Grain Exchange'},
    {'name': 'Rice', 'rate': '290.00', 'seller': 'Rice World'},
    {'name': 'Corn', 'rate': '220.00', 'seller': 'AgriMart'},
    {'name': 'Barley', 'rate': '280.00', 'seller': 'Farm Supply Co.'},
    {'name': 'Oats', 'rate': '185.00', 'seller': 'Whole Grains Inc.'},
    {'name': 'Soybeans', 'rate': '325.00', 'seller': 'Soybean Solutions'},
    {'name': 'Wheat', 'rate': '260.00', 'seller': 'Trade Hub'},
    {'name': 'Rice', 'rate': '310.00', 'seller': 'Rice Traders'},
    {'name': 'Corn', 'rate': '215.00', 'seller': 'Corn Suppliers'},
    {'name': 'Barley', 'rate': '265.00', 'seller': 'Farm Fresh'},
    {'name': 'Oats', 'rate': '190.00', 'seller': 'Oat Mills'},
    {'name': 'Soybeans', 'rate': '330.00', 'seller': 'AgroCorp'},
  ];

  // Group commodities by name
  final Map<String, List<Map<String, String>>> groupedCommodities = {};
  late final List<Map<String, dynamic>> groupedList;

  @override
  void initState() {
    for (var commodity in commodities) {
      final name = commodity['name']!;
      if (!groupedCommodities.containsKey(name)) {
        groupedCommodities[name] = [];
      }
      groupedCommodities[name]!.add(commodity);
    }

    // Convert grouped commodities to a list for ListView.builder
    groupedList = groupedCommodities.entries
        .map((entry) => {'name': entry.key, 'items': entry.value})
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Todays Market', style: TextStyle(fontSize: 24)),
          Expanded(
            child: ListView.builder(
              itemCount: groupedList.length,
              itemBuilder: (context, index) {
                final group = groupedList[index];
                final commodityName = group['name'] as String;
                final items = group['items'] as List<Map<String, String>>;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commodityName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 10,
                      children: [
                        ...items.map((item) {
                          return SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              elevation: 4.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('\$${item['rate']}'),
                                    Text('${item['seller']}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
