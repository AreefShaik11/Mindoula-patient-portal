import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../viewmodel/message_view_model.dart';
import '../model/message_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class MessageCenterScreen extends ConsumerStatefulWidget {
  const MessageCenterScreen({super.key});

  @override
  ConsumerState<MessageCenterScreen> createState() => _MessageCenterScreenState();
}

class _MessageCenterScreenState extends ConsumerState<MessageCenterScreen> {
  bool _isChatOpenOnMobile = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(messageViewModelProvider);
    final threads = state['threads'] as List<MessageThread>;
    final selectedId = state['selectedThreadId'] as String;
    final selectedThread = threads.firstWhere((t) => t.id == selectedId);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 1024;

        final threadListWidget = _ThreadList(
          threads: threads,
          selectedId: selectedId,
          isMobile: isMobile,
          onThreadSelected: isMobile
              ? () => setState(() => _isChatOpenOnMobile = true)
              : null,
        );

        final chatViewWidget = _ChatView(
          thread: selectedThread,
          isMobile: isMobile,
          onBack: () => setState(() => _isChatOpenOnMobile = false),
        );

        if (isMobile) {
          return _isChatOpenOnMobile ? chatViewWidget : threadListWidget;
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            threadListWidget,
            const VerticalDivider(width: 1),
            Expanded(child: chatViewWidget),
          ],
        );
      },
    );
  }
}

class _ThreadList extends ConsumerWidget {
  final List<MessageThread> threads;
  final String selectedId;
  final bool isMobile;
  final VoidCallback? onThreadSelected;

  const _ThreadList({
    required this.threads,
    required this.selectedId,
    required this.isMobile,
    this.onThreadSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: isMobile ? double.infinity : 440,
      child: Column(
        children: [
          const _ThreadListHeader(),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: threads.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final t = threads[index];
                final isSelected = t.id == selectedId;
                return _ThreadTile(
                  thread: t,
                  isSelected: isSelected,
                  isMobile: isMobile,
                  onTap: () {
                    ref.read(messageViewModelProvider.notifier).selectThread(t.id);
                    onThreadSelected?.call();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ThreadListHeader extends StatelessWidget {
  const _ThreadListHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Messages',
            style: AppTypography.h3.copyWith(fontSize: 24),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
                color: AppColors.textPrimary,
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
                color: AppColors.textPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThreadTile extends StatelessWidget {
  final MessageThread thread;
  final bool isSelected;
  final bool isMobile;
  final VoidCallback onTap;

  const _ThreadTile({
    required this.thread,
    required this.isSelected,
    required this.isMobile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isSelected && !isMobile)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 6,
              color: AppColors.primaryBlue,
            ),
          ),
        ListTile(
          selected: isMobile ? false : isSelected,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          title: Text(
            thread.participantName,
            style: AppTypography.bodyLarge.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              thread.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat('h:mm a').format(thread.lastTimestamp),
                style: AppTypography.bodySmall.copyWith(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              if (thread.unreadCount > 0)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}

class _ChatView extends StatelessWidget {
  final MessageThread thread;
  final bool isMobile;
  final VoidCallback onBack;

  const _ChatView({
    required this.thread,
    required this.isMobile,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ChatHeader(
          participantName: thread.participantName,
          isMobile: isMobile,
          onBack: onBack,
        ),
        const Divider(height: 1),
        Expanded(
          child: _MessageList(
            messages: thread.messages,
            participantName: thread.participantName,
          ),
        ),
        const Divider(height: 1),
        _ChatInput(isMobile: isMobile),
      ],
    );
  }
}

class _ChatHeader extends StatelessWidget {
  final String participantName;
  final bool isMobile;
  final VoidCallback onBack;

  const _ChatHeader({
    required this.participantName,
    required this.isMobile,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack,
              padding: const EdgeInsets.only(right: 16),
            ),
          Expanded(
            child: Text(
              participantName,
              style: AppTypography.h3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (!isMobile)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Request Appointment',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
        ],
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  final List<Message> messages;
  final String participantName;

  const _MessageList({
    required this.messages,
    required this.participantName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.chatBackground,
      child: ListView.builder(
        padding: const EdgeInsets.all(32),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          if (message.senderType == MessageSenderType.system) {
            return _NotificationCard(message: message);
          }
          return _MessageBubble(
            message: message,
            participantName: participantName,
          );
        },
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
  final bool isMobile;

  const _ChatInput({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 24,
      ),
      child: Row(
        children: [
          if (!isMobile)
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 20),
              label: const Text('Attach file'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryBlue,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.add),
              color: AppColors.primaryBlue,
              onPressed: () {},
            ),
          SizedBox(width: isMobile ? 8 : 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Message Here',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: isMobile ? 8 : 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Send',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
}

class _MessageBubble extends StatelessWidget {
  final Message message;
  final String participantName;
  const _MessageBubble({
    required this.message,
    required this.participantName,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.senderType == MessageSenderType.user;
    return Column(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            isUser ? 'You' : participantName,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.senderName,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 6),
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isUser ? AppColors.chatBubbleSent : AppColors.chatBubbleReceived,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message.content,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text(
            DateFormat('h:mm a').format(message.timestamp),
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final Message message;
  const _NotificationCard({required this.message});

  @override
  Widget build(BuildContext context) {
    final isAppointment = message.type == MessageType.appointmentConfirmation;
    final accentColor =
        isAppointment ? AppColors.chatAccentOrange : AppColors.chatAccentBlue;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.notificationCardBg,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 8,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(11),
                  bottomLeft: Radius.circular(11),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.content,
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (isAppointment) ...[
                      const SizedBox(height: 16),
                      const _NotificationDetail(
                        label: 'Date',
                        value: 'Thursday, April 3, 2026',
                      ),
                      const _NotificationDetail(
                        label: 'Time',
                        value: '10:00 - 10:30 AM ET',
                      ),
                      const _NotificationDetail(
                        label: 'Type',
                        value: 'Video visit',
                      ),
                    ],
                    if (message.type == MessageType.labResults) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Results from March 22 visit are now available in your portal. Your provider will review these with you at your next appointment.',
                        style: AppTypography.bodyLarge.copyWith(height: 1.5),
                      ),
                    ],
                    if (message.actionLabel != null) ...[
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.primaryBlue,
                            side: const BorderSide(color: AppColors.primaryBlue),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            message.actionLabel!,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationDetail extends StatelessWidget {
  final String label;
  final String value;

  const _NotificationDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: AppTypography.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          Text(value, style: AppTypography.bodyLarge),
        ],
      ),
    );
  }
}
