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
    final messageData = ref.watch(messageViewModelProvider);
    final threads = messageData['threads'] as List<MessageThread>;
    final selectedThreadId = messageData['selectedThreadId'] as String;
    final selectedThread = threads.firstWhere((t) => t.id == selectedThreadId);

    return Container(
      height: MediaQuery.of(context).size.height - 150,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Sidebar: Message List
          _MessageList(
            threads: threads,
            selectedId: selectedThreadId,
            onSelect: (id) => ref.read(messageViewModelProvider.notifier).selectThread(id),
          ),
          const VerticalDivider(width: 1),
          // Main: Message Thread
          Expanded(
            child: _MessageThreadView(thread: selectedThread),
          ),
        ],
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  final List<MessageThread> threads;
  final String selectedId;
  final Function(String) onSelect;

  const _MessageList({
    required this.threads,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: AppColors.sidebarBackground,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Messages', style: AppTypography.h3),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_square, color: AppColors.primaryBlue),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: threads.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final t = threads[index];
                final isSelected = t.id == selectedId;
                return ListTile(
                  onTap: () => onSelect(t.id),
                  tileColor: isSelected ? Colors.white : Colors.transparent,
                  title: Text(t.participantName, style: AppTypography.contentStyle),
                  subtitle: Text(t.lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(DateFormat('hh:mm').format(t.lastTimestamp), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                      if (t.unreadCount > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: AppColors.primaryBlue, borderRadius: BorderRadius.circular(10)),
                          child: Text(t.unreadCount.toString(), style: const TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageThreadView extends StatelessWidget {
  final MessageThread thread;

  const _MessageThreadView({required this.thread});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            children: [
              const CircleAvatar(backgroundColor: Color(0xFFE5E7EB), child: Icon(Icons.person, color: Colors.grey)),
              const SizedBox(width: 12),
              Text(thread.participantName, style: AppTypography.contentStyle),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: thread.messages.length,
            itemBuilder: (context, index) {
              final m = thread.messages[index];
              return _MessageBubble(message: m);
            },
          ),
        ),
        const Divider(height: 1),
        _MessageInputArea(),
      ],
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Message message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isProvider = message.senderType == MessageSenderType.provider;
    
    return Align(
      alignment: isProvider ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isProvider ? Colors.white : AppColors.messageBlue,
          borderRadius: BorderRadius.circular(16),
          border: isProvider ? Border.all(color: AppColors.border) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.content, style: AppTypography.bodyMedium),
            if (message.type == MessageType.appointmentRequest)
              _SpecialtyCard(
                label: message.actionLabel ?? 'Request',
                onTap: () {},
              )
            else if (message.type == MessageType.prescriptionUpdate)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppColors.messageBeige, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(Icons.medication, size: 20, color: AppColors.warning),
                    const SizedBox(width: 8),
                    Text('Prescription update', style: AppTypography.bodyMedium),
                  ],
                ),
              ),
            const SizedBox(height: 4),
            Text(
              DateFormat('hh:mm AM').format(message.timestamp),
              style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpecialtyCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SpecialtyCard({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.messageBeige,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: Text('Appointment request')),
          TextButton(
            onPressed: onTap,
            child: Text(label, style: const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class _MessageInputArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.send, color: AppColors.primaryBlue)),
        ],
      ),
    );
  }
}
