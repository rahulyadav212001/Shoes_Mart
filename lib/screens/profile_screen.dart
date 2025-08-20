import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Rahul Yadav',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'yadavrahul212001@gmail.com',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            // Theme Toggle
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return SwitchListTile(
                    title: Text(
                      themeProvider.isDark ? 'Dark Mode' : 'Light Mode',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    secondary: Icon(
                      themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
                    ),
                    value: themeProvider.isDark,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  );
                },
              ),
            ),

            // Profile Menu Items
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'Personal Information',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.shopping_bag_outlined,
                    title: 'Order History',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.favorite_outline,
                    title: 'Wishlist',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {},
                    showDivider: false,
                  ),
                ],
              ),
            ),

            // Logout Button
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out successfully')),
                  );
                },
                icon: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).colorScheme.error),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            // App Info
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'ShoesApp v1.0.0',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Made with ❤️ for shoe lovers',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
        if (showDivider)
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
      ],
    );
  }
}