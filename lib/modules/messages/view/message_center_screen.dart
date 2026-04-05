import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../viewmodel/message_view_model.dart';
import '../model/message_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class MessageCenterScreen extends ConsumerWidget {
  const MessageCenterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messageViewModelProvider);
    final threads = state['threads'] as List<MessageThread>;
    final selectedId = state['selectedThreadId'] as String;
    final selectedThread = threads.firstWhere((t) => t.id == selectedId);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thread List
        SizedBox(
          width: 350,
          child: ListView.separated(
            itemCount: threads.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final t = threads[index];
              return ListTile(
                selected: t.id == selectedId,
                selectedTileColor: AppColors.messageBlue.withValues(alpha: 0.3),
                title: Text(t.participantName, style: AppTypography.h3.copyWith(fontSize: 16)),
                subtitle: Text(t.lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(DateFormat('hh:mm').format(t.lastTimestamp), style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                    if (t.unreadCount > 0)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: AppColors.primaryBlue, borderRadius: BorderRadius.circular(10)),
                        child: Text('${t.unreadCount}', style: const TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                  ],
                ),
                onTap: () => ref.read(messageViewModelProvider.notifier).selectThread(t.id),
              );
            },
          ),
        ),
        const VerticalDivider(width: 1),
        // Chat View
        Expanded(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.1), child: Text(selectedThread.participantName[0])),
                    const SizedBox(width: 12),
                    Text(selectedThread.participantName, style: AppTypography.h3),
                  ],
                ),
              ),
              const Divider(),
              // Messages
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: selectedThread.messages.length,
                  itemBuilder: (context, index) {
                    final message = selectedThread.messages[index];
                    return _MessageBubble(message: message);
                  },
                ),
              ),
              // Input
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    suffixIcon: IconButton(icon: const Icon(Icons.send_rounded, color: AppColors.primaryBlue), onPressed: () {}),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Message message;
  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.senderType == MessageSenderType.user;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primaryBlue : AppColors.messageBlue,
          borderRadius: BorderRadius.circular(16).copyWith(
            topLeft: isUser ? const Radius.circular(16) : Radius.zero,
            bottomRight: isUser ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.content,
              style: TextStyle(color: isUser ? Colors.white : AppColors.textPrimary, fontSize: 16),
            ),
            if (message.type == MessageType.appointmentRequest)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryBlue,
                  ),
                  child: Text(message.actionLabel ?? 'Request'),
                ),
              ),
            const SizedBox(height: 4),
            Text(
              DateFormat('hh:mm').format(message.timestamp),
              style: TextStyle(color: (isUser ? Colors.white : AppColors.textSecondary).withValues(alpha: 0.7), fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
