import 'package:flutter/material.dart';

class SocialAuthWidget extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;
  final VoidCallback onLoginTap;

  const SocialAuthWidget({
    super.key,
    required this.onGoogleTap,
    required this.onAppleTap,
    required this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDivider(),
        const SizedBox(height: 24),
        _buildSocialButton(
          "Continue with Google",
          Icons.g_mobiledata,
          onGoogleTap,
        ),
        const SizedBox(height: 16),
        _buildSocialButton("Continue with Apple", Icons.apple, onAppleTap),
        const SizedBox(height: 24),
        _buildLoginLink(),
        const SizedBox(height: 24),
        _buildVerifiedBadge(),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.black12)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("or", style: TextStyle(color: Colors.grey[400])),
        ),
        const Expanded(child: Divider(color: Colors.black12)),
      ],
    );
  }

  Widget _buildSocialButton(String text, IconData icon, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: const BorderSide(color: Colors.black12),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.black),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xff0a0e1e),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: onLoginTap,
          child: const Text(
            "Login",
            style: TextStyle(
              color: Color(0xff3b6ef5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerifiedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xfff0f4ff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified_user_outlined, size: 16, color: Colors.green),
          SizedBox(width: 8),
          Text(
            "VERIFIED MEDICAL PLATFORM",
            style: TextStyle(
              color: Color(0xff3b6ef5),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
