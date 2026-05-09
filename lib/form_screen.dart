import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // GlobalKey: penghubung antara Form widget dan kode kita
  final _formKey = GlobalKey<FormState>();

  // Controller: untuk membaca ISI field dan menghapusnya
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _emailController = TextEditingController();
  final _jurusanController = TextEditingController();
  final _teleponController = TextEditingController();

  // buat methode simpan data
  void _simpanData() {}

  // buat methode untuk reset form
  void _resetForm() {
    _formKey.currentState!.reset(); // hapus pesan error validasi
    _namaController.clear();
    _nimController.clear();
    _emailController.clear();
    _jurusanController.clear();
    _teleponController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '📝 Pendaftaran Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 13, 61, 45),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Info Banner ───────────────────────────
              const Card(
                color: Color(0xFFE3F2FD),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Isi semua field yang bertanda * (wajib diisi)',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // ── Field NAMA ───────────────────────────
              _buildTextField(
                controller: _namaController,
                label: 'Nama Lengkap *',
                hint: 'Contoh: Andi Pratama',
                icon: Icons.person,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  if (val.length < 3) {
                    return 'Nama minimal 3 karakter';
                  }
                  return null; // null = VALID (tidak ada error)
                },
              ),

              // ── Field NIM ────────────────────────────
              _buildTextField(
                controller: _nimController,
                label: 'NIM *',
                hint: 'Contoh: 2021001',
                icon: Icons.badge,
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return 'NIM tidak boleh kosong';
                  if (val.length < 5) return 'NIM minimal 5 digit';
                  return null;
                },
              ),

              // ── Field EMAIL ──────────────────────────
              _buildTextField(
                controller: _emailController,
                label: 'Email *',
                hint: 'Contoh: andi@mahasiswa.ac.id',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return 'Email tidak boleh kosong';
                  if (!val.contains('@') || !val.contains('.')) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),

              // ── Field JURUSAN ────────────────────────
              _buildTextField(
                controller: _jurusanController,
                label: 'Jurusan *',
                hint: 'Contoh: Teknik Informatika',
                icon: Icons.school,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return 'Jurusan tidak boleh kosong';
                  return null;
                },
              ),

              // ── Field TELEPON (opsional, tidak ada validator) ──
              _buildTextField(
                controller: _teleponController,
                label: 'No. Telepon (Opsional)',
                hint: 'Contoh: 08123456789',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: null,
              ),
              const SizedBox(height: 24),

              // ── Tombol SIMPAN ───────────────────────
              ElevatedButton.icon(
                onPressed: _simpanData,
                icon: const Icon(Icons.save),
                label: const Text(
                  'SIMPAN DATA',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 8),

              // ── Tombol RESET ─────────────────────────
              OutlinedButton.icon(
                onPressed: _resetForm,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
