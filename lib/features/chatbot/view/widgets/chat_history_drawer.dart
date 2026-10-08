import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../base/bloc/index.dart';
import '../../../../common/app_theme/index.dart';
import '../bloc/rio_chat_bloc.dart';

/// Drawer hiển thị danh sách các session chat trong lịch sử.
class ChatHistoryDrawer extends StatelessWidget {
  const ChatHistoryDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF6F7FB),
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _DrawerHeader(),
            const _NewChatButton(),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<RioChatBloc, RioChatState>(
                builder: (context, state) {
                  if (state.status == BaseStateStatus.loading &&
                      !state.hasChatHistory) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!state.hasChatHistory) {
                    return const _EmptyHistory();
                  }

                  final groups = groupSessionsByDate(state.chatHistory);
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<RioChatBloc>().add(
                        const RioChatEvent.loadHistory(),
                      );
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 24),
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        return _SessionGroup(group: groups[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Header drawer: gradient với avatar Rio + tiêu đềề.
class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 12, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/icons/apps/chatbot/smile.png',
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lịch sử trò chuyện',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Rio - Trợ lý ảo',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: 'Tải lại',
            onPressed: () => context.read<RioChatBloc>().add(
              const RioChatEvent.loadHistory(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Nút bắt đầu cuộc hội thoại mới.
class _NewChatButton extends StatelessWidget {
  const _NewChatButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.read<RioChatBloc>().add(const RioChatEvent.startNew());
            Scaffold.of(context).closeDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add_comment_outlined,
                    color: AppColors.primaryERP,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Cuộc hội thoại mới',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.gray,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Data class: 1 group sessions theo ngày.
class SessionGroupData {
  const SessionGroupData({required this.title, required this.sessions});

  final String title;
  final List<ChatHistorySessionModel> sessions;
}

/// Nhóm session theo ngày (Hôm nay / Hôm qua / Tuần này / Trước đó).
List<SessionGroupData> groupSessionsByDate(
  List<ChatHistorySessionModel> sessions,
) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final weekAgo = today.subtract(const Duration(days: 7));

  final todayList = <ChatHistorySessionModel>[];
  final yesterdayList = <ChatHistorySessionModel>[];
  final weekList = <ChatHistorySessionModel>[];
  final olderList = <ChatHistorySessionModel>[];

  for (final s in sessions) {
    final d = DateTime(
      s.updatedDate.year,
      s.updatedDate.month,
      s.updatedDate.day,
    );
    if (d.isAtSameMomentAs(today)) {
      todayList.add(s);
    } else if (d.isAtSameMomentAs(yesterday)) {
      yesterdayList.add(s);
    } else if (d.isAfter(weekAgo)) {
      weekList.add(s);
    } else {
      olderList.add(s);
    }
  }

  final groups = <SessionGroupData>[];
  if (todayList.isNotEmpty) {
    groups.add(SessionGroupData(title: 'Hôm nay', sessions: todayList));
  }
  if (yesterdayList.isNotEmpty) {
    groups.add(SessionGroupData(title: 'Hôm qua', sessions: yesterdayList));
  }
  if (weekList.isNotEmpty) {
    groups.add(SessionGroupData(title: 'Tuần này', sessions: weekList));
  }
  if (olderList.isNotEmpty) {
    groups.add(SessionGroupData(title: 'Trước đó', sessions: olderList));
  }
  return groups;
}

/// Widget hiển thị 1 group.
class _SessionGroup extends StatelessWidget {
  const _SessionGroup({required this.group});

  final SessionGroupData group;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Text(
            group.title.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.hintText,
              letterSpacing: 0.8,
            ),
          ),
        ),
        ...group.sessions.map((s) => _SessionTile(session: s)),
      ],
    );
  }
}

/// Tile hiển thị 1 session chat.
class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session});

  final ChatHistorySessionModel session;

  @override
  Widget build(BuildContext context) {
    final updated = _formatDate(session.updatedDate);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.read<RioChatBloc>().add(
              RioChatEvent.selectSession(sessionId: session.sessionId),
            );
            Scaffold.of(context).closeDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xFFF0F4FF),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/icons/apps/chatbot/smile.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cuộc hội thoại #${session.sessionId}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.heading,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        updated,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.hintText,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.gray,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return 'Vừa xong';
    if (diff.inHours < 1) return '${diff.inMinutes} phút trước';
    if (diff.inDays < 1) return '${diff.inHours} giờ trước';
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }
}

class _EmptyHistory extends StatelessWidget {
  const _EmptyHistory();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.history_toggle_off,
                size: 40,
                color: AppColors.primaryERP.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Chưa có lịch sử chat',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.heading,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Bắt đầu trò chuyện để lưu lại lịch sử',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: AppColors.hintText),
            ),
            const SizedBox(height: 20),
            Material(
              color: AppColors.primaryERP,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  context.read<RioChatBloc>().add(
                    const RioChatEvent.startNew(),
                  );
                  Scaffold.of(context).closeDrawer();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Text(
                    'Bắt đầu trò chuyện',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
