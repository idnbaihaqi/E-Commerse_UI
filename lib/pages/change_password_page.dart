import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: const Color.fromARGB(255, 255, 160, 20), // HIJAU
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Header Gradient Hijau
          Container(
            width: double.infinity,
            height: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 160, 20), // HIJAU TUA
                  Color.fromARGB(255, 255, 160, 20), // HIJAU UTAMA
                  Color.fromARGB(255, 255, 160, 20), // HIJAU MUDA
                ],
                begin: Alignment.bottomRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.5, 1.0], // Kontras lebih jelas
              ),
            ),
              child: const Icon(
                Icons.lock_reset,
                size: 40,
                color: Color(0xFFFFFFFF),
              ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    // Informational Text
                    const Text(
                      'Enter your current password and new password',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),

                    // Current Password Field (Password Lama)
                    _buildPasswordField(
                      controller: _currentPasswordController,
                      label: 'Current Password',
                      isPasswordVisible: _isCurrentPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isCurrentPasswordVisible =
                              !_isCurrentPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // New Password Field (Password Baru)
                    _buildPasswordField(
                      controller: _newPasswordController,
                      label: 'New Password',
                      isPasswordVisible: _isNewPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isNewPasswordVisible = !_isNewPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // Confirm New Password Field (Konfirmasi Password Baru)
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      label: 'Confirm New Password',
                      isPasswordVisible: _isConfirmPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                      validator: (value) {
                        if (value != _newPasswordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    // Simpan Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _ubahPassword,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 160, 20), // HIJAU
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 255, 160, 20)), // HIJAU
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color.fromARGB(255, 255, 160, 20), // HIJAU
          ),
          onPressed: onToggleVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromARGB(255, 255, 160, 20)), // HIJAU
        ),
      ),
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '$label harus diisi';
            }
            if (value.length < 6) {
              return 'Minimum 6 character';
            }
            return null;
          },
    );
  }

  void _ubahPassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password Succesfully Changed!'),
          backgroundColor: Colors.orange,
        ),
      );
      // Kembali ke AccountPage
      Navigator.pushReplacementNamed(context, 'AccountPage');
    }
  }
}