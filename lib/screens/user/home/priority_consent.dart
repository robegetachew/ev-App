import 'package:flutter/material.dart';
import 'paymentmethod.dart';

class PriorityConsentPage extends StatefulWidget {
  const PriorityConsentPage({super.key});

  @override
  State<PriorityConsentPage> createState() => _PriorityConsentPageState();
}

class _PriorityConsentPageState extends State<PriorityConsentPage> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C689),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                const Text(
                  "Priority Service",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: const Text(
                      """Our Priority Service for EV charger booking ensures a seamless, fast, and reliable experience for customers seeking to charge their electric vehicles. By opting for this service, you agree to the following terms:

1. Priority Access: Enjoy faster booking and guaranteed access to selected EV chargers, reducing wait times and ensuring a convenient charging experience.
2. Booking Flexibility: Access exclusive booking slots and preferred time slots for high-demand locations.
3. Cancellation and Rescheduling: Free cancellations or rescheduling are available within the specified time frame, subject to availability.
4. Service Coverage: This service covers booking priority access, and real-time support at participating charging stations.
5. Charges and Fees: Additional fees may apply for premium booking slots or priority services, which will be clearly communicated during the booking process. Fees may vary based on location.
6. Liability: The service provider is not liable for delays, unavailability, or interruptions due to technical issues, maintenance, or unforeseen circumstances.
7. Amendments: The provider reserves the right to modify these terms at any time, with prior notice where possible.
8. Termination: Misuse of the priority booking service may result in suspension or termination without refund.""",
                      style: TextStyle(fontSize: 13, height: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(
                      value: agreed,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        setState(() => agreed = val!);
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "By using this service, you acknowledge and agree to these terms and conditions.",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: agreed
                          ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const PaymentMethodPage()),
                        );
                      }
                          : null,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      disabledBackgroundColor: Colors.grey.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Proceed", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
