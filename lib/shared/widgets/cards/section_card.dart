import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
// import '../../../core/theme/app_colors.dart';

class SectionCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final List<Widget>? actions;

  const SectionCard({super.key, this.title, required this.child, this.actions});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null || actions != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null)
                    Text(title!, style: Theme.of(context).textTheme.titleLarge),
                  if (actions != null) Row(children: actions!),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
            ],
            child,
          ],
        ),
      ),
    );
  }
}
