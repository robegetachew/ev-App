import 'package:flutter/material.dart';
import 'user/location_permission_screen.dart';

class SignupStepsScreen extends StatefulWidget {
  const SignupStepsScreen({super.key});

  @override
  State<SignupStepsScreen> createState() => _SignupStepsScreenState();
}

class _SignupStepsScreenState extends State<SignupStepsScreen> {
  int _currentStep = 0;

  final _firstNameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final List<TextEditingController> _otpControllers =
  List.generate(4, (_) => TextEditingController());

  void _nextStep() {
    if (_currentStep < 4) {
      setState(() {
        _currentStep++;
      });
    }
  }

  Widget _inputField(String hint, TextEditingController controller,
      {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildProgressDots(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentStep == index ? Colors.green : Colors.white,
            border: Border.all(color: Colors.green, width: 2),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color:
                _currentStep == index ? Colors.white : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Column(
          children: [
            _buildTitle(),
            const SizedBox(height: 24),
            _inputField('First Name', _firstNameController),
            const SizedBox(height: 16),
            _inputField('Father Name', _fatherNameController),
            const SizedBox(height: 24),
            _buildProgressDots(3),
            const SizedBox(height: 16),
            _nextButton(),
          ],
        );
      case 1:
        return Column(
          children: [
            _buildTitle(),
            const SizedBox(height: 24),
            _inputField('Phone Number', _phoneController),
            const SizedBox(height: 16),
            _inputField('Email Address', _emailController),
            const SizedBox(height: 24),
            _buildProgressDots(3),
            const SizedBox(height: 16),
            _nextButton(),
          ],
        );
      case 2:
        return Column(
          children: [
            _buildTitle(),
            const SizedBox(height: 24),
            _inputField('Password', _passwordController, obscure: true),
            const SizedBox(height: 16),
            _inputField('Confirm Password', _confirmPasswordController,
                obscure: true),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text('Register'),
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            const Text(
              'OTP Verification',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Check Your Phone to see the verification code',
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                    (index) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      controller: _otpControllers[index],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Continue', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text('Resend', style: TextStyle(color: Colors.black54)),
              ),
            ),
          ],
        );

      case 4:
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LocationPermissionScreen()),
          );
        });

        return Column(
          children: [
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Check Your Phone to see the verification code',
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  CircularProgressIndicator(color: Colors.green, strokeWidth: 2),
                  SizedBox(height: 12),
                  Text(
                    'Please wait ....',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Continue", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Resend', style: TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        );


      default:
        return const SizedBox();
    }
  }

  Widget _nextButton() => Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: _nextStep,
      child:
      const Text("Next →", style: TextStyle(color: Colors.green)),
    ),
  );

  Widget _buildTitle() {
    return Column(
      children: const [
        Text('Register',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green)),
        SizedBox(height: 8),
        Text('Register your account',
            style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images 1.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 32),
                  decoration: const BoxDecoration(
                    color: Color(0xFFA3E5DB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: _buildStepContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
