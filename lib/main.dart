import 'package:appstudents/form_screen.dart';
import 'package:appstudents/home_screen.dart';
import 'package:appstudents/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// buat class MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Rekan Data Mahasiswa',
      debugShowCheckedModeBanner: false, // hapus banner DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainHome(),
    );
  }
}

// buat class baru MainWrapper
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  State<MainHome> createState() => _MainHomeState();
}

// buat class _MainHomeState
class _MainHomeState extends State<MainHome> {
  // Simpan halaman mana yang sedang aktif
  // 0 = Home, 1 = Form, 2 = Profil
  int _selectedIndex = 0;

  // Daftar halaman — urutan harus sesuai dengan items di BottomNavigationBar
  static const List<Widget> _pages = [
    HomeScreen(),
    FormScreen(),
    ProfileScreen(),
  ];

  // Fungsi ini dipanggil ketika pengguna mengetuk ikon navigasi
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // update → Flutter rebuild UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tampilkan halaman sesuai indeks aktif
      body: _pages[_selectedIndex],

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: 'Daftar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
