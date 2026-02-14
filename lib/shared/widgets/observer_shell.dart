import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ObserverShell extends StatelessWidget {
  final Widget child;
  const ObserverShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: _calculateSelectedIndex(context) == 1 
        ? FloatingActionButton(
            onPressed: () => context.go('/reports/create'),
            child: const Icon(Icons.add),
          )
        : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'My Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/reports')) return 1;
    if (location.startsWith('/profile')) return 2;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/reports');
        break;
      case 2:
        context.go('/profile');
        break;
    }
  }
}
