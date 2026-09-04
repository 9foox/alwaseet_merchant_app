import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeTab(),
      const ProductsScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'المنتجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'الطلبات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة التحكم'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مرحباً، التاجر',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatCard(
                  title: 'إجمالي الطلبات',
                  value: '12',
                  icon: Icons.receipt,
                ),
                _StatCard(
                  title: 'الطلبات المعلقة',
                  value: '3',
                  icon: Icons.pending_actions,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatCard(
                  title: 'المبيعات اليومية',
                  value: '5000 ر.س',
                  icon: Icons.trending_up,
                ),
                _StatCard(
                  title: 'قيمة المخزون',
                  value: '50000 ر.س',
                  icon: Icons.inventory,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'الطلبات الأخيرة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: const Text('محمد أحمد'),
                subtitle: const Text('قيد المعالجة'),
                trailing: const Text('500 ر.س'),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: const Text('فاطمة علي'),
                subtitle: const Text('مكتمل'),
                trailing: const Text('750 ر.س'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 32, color: const Color(0xFF1976D2)),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المنتجات'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const CircleAvatar(child: Text('م')),
              title: const Text('منتج تجريبي 1'),
              subtitle: const Text('السعر: 100 ر.س | الكمية: 50'),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(child: Text('تعديل')),
                  const PopupMenuItem(child: Text('حذف')),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const CircleAvatar(child: Text('م')),
              title: const Text('منتج تجريبي 2'),
              subtitle: const Text('السعر: 200 ر.س | الكمية: 30'),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(child: Text('تعديل')),
                  const PopupMenuItem(child: Text('حذف')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الطلبات'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              title: const Text('محمد أحمد'),
              subtitle: const Text('500 ر.س'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('الحالة: قيد المعالجة'),
                      const SizedBox(height: 8),
                      DropdownButton<String>(
                        value: 'قيد المعالجة',
                        items: ['قيد المعالجة', 'مشحون', 'مكتمل']
                            .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              title: const Text('فاطمة علي'),
              subtitle: const Text('750 ر.س'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('الحالة: مكتمل'),
                      const SizedBox(height: 8),
                      DropdownButton<String>(
                        value: 'مكتمل',
                        items: ['قيد المعالجة', 'مشحون', 'مكتمل']
                            .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              child: Text('م', style: TextStyle(fontSize: 40)),
            ),
            const SizedBox(height: 20),
            const Text(
              'التاجر',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'merchant@app.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('تعديل الملف الشخصي'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('الإعدادات'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('مساعدة'),
              onTap: () {},
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {},
              child: const Text(
                'تسجيل الخروج',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
