import 'package:flutter/material.dart';
import 'booking.dart';

class ChargerTypePage extends StatefulWidget {
  final Map<String, dynamic> station;

  const ChargerTypePage({super.key, required this.station});

  @override
  State<ChargerTypePage> createState() => _ChargerTypePageState();
}

class _ChargerTypePageState extends State<ChargerTypePage> {
  int? selectedIndex;

  final List<Map<String, String>> chargers = [
    {'brand': 'TESLA', 'model': 'Model S . 40', 'power': '100 KW', 'type': 'AC/DC'},
    {'brand': 'KIA', 'model': 'Model S . 40', 'power': '100 KW', 'type': 'AC/DC'},
    {'brand': 'AUDI', 'model': 'Model S . 40', 'power': '100 KW', 'type': 'AC/DC'},
    {'brand': 'PORSCHE', 'model': 'Model S . 40', 'power': '100 KW', 'type': 'AC'},
    {'brand': 'MERCEDES', 'model': 'Model S . 40', 'power': '100 KW', 'type': 'AC/DC'},
    {'brand': 'TOYOTA', 'model': 'Model S . 40', 'power': '100 KW', 'type': 'AC/DC'},
    {'brand': 'HAYUNDA', 'model': 'Model S . 40', 'power': '100 KW', 'type': 'AC/DC'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("select Charger", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search charger',
                      prefixIcon: const Icon(Icons.search, color: Colors.green),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: chargers.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final charger = chargers[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Booking(),
                          ),
                        );
                      });
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.flash_on, color: Colors.black),
                            Text(charger['type']!, style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                charger['brand']!,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                charger['model']!,
                                style: const TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              charger['power']!,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text("Max.Power",
                                style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: selectedIndex == index ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.green, width: 2),
                          ),
                          child: selectedIndex == index
                              ? const Icon(Icons.check, size: 14, color: Colors.white)
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
