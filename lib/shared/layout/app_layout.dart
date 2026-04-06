import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/sidebar/app_sidebar.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    String location;
    try {
      location = GoRouterState.of(context).uri.path;
    } catch (_) {
      location = '/';
    }

    final isFullScreen = location == '/messages';

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        final padding = isDesktop
            ? const EdgeInsets.only(left: 24.0, top: 74.0, right: 24.0, bottom: 24.0)
            : const EdgeInsets.all(16.0);

        final content = isFullScreen
            ? child
            : SingleChildScrollView(
                padding: padding,
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1214),
                    child: child,
                  ),
                ),
              );

        if (isDesktop) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Row(
              children: [
                const AppSidebar(),
                Expanded(child: content),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.sidebarHeader,
            title: const Text('Member Portal', style: TextStyle(color: Colors.white)),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          drawer: const Drawer(
            child: AppSidebar(),
          ),
          body: content,
        );
      },
    );
  }
}
