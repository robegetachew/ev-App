import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> paymentMethods = [
    {'name': 'M-Pesa', 'amount': '954 Birr', 'icon': Icons.credit_card},
    {'name': 'MasterCard', 'amount': '54 USD', 'image': 'assets/mastercard.png'},
    {'name': 'PaYPal', 'amount': '954 USD', 'image': 'assets/paypal.png'},
    {'name': 'Tele Birr', 'amount': '954 Birr', 'icon': Icons.credit_card},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Select Payment Method",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ...List.generate(paymentMethods.length, (index) {
              final method = paymentMethods[index];
              final hasImage = method.containsKey('image');
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                },
                child: Container(
                  height: 70,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFD3FCE8) : const Color(0xFFE8FFF3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      hasImage
                          ? Image.asset(method['image'] as String, height: 35)
                          : Icon(method['icon'] as IconData, color: Colors.green, size: 30),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          method['name'] as String,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        method['amount'] as String,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.credit_card, size: 18, color: Colors.green),
                      if (isSelected)
                        const Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(Icons.check_circle, size: 18, color: Colors.green),
                        ),
                    ],
                  ),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Continue logic here
                },
                child: const Text("continue", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
