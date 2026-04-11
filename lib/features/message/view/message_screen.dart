// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình danh sách tin nhắn - hiển thị các cuộc trò chuyện gần đây dạng list
//
// Giao diện:
//   - AppBar với tiêu đề "Tin nhắn" và icon tìm kiếm
//   - Tabs: "Tất cả", "Cá nhân", "Nhóm"
//   - Danh sách cuộc trò chuyện (_ConversationTile) với avatar, tên, tin nhắn gần nhất, thời gian
//   - Badge số tin chưa đọc màu đỏ
//   - Dữ liệu hiện tại là mock tĩnh
//
// Tap vào một tile sẽ navigate đến [ChatScreen].

import 'package:flutter/material.dart';

import '../../../../../common/app_theme/index.dart';
import 'chat_screen.dart';

/// Màn hình danh sách tin nhắn - tab thứ nhất trong DashboardScreen.
///
/// Hiển thị danh sách cuộc trò chuyện gần đây với 3 tabs lọc: Tất cả, Cá nhân, Nhóm.
/// Dữ liệu là mock tĩnh, cần tạo BLoC + gọi API khi backend sẵn sàng.
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  // Mock data: danh sách cuộc trò chuyện
  final List<_ConversationData> _allConversations = [
    _ConversationData(
      id: '1',
      name: 'Phòng Nhân sự',
      avatar: 'HR',
      avatarColor: const Color(0xFF2957A6),
      lastMessage: 'Nhắc nhở: Deadline báo cáo công việc tuần này',
      time: '10:30',
      unreadCount: 3,
      isGroup: true,
      isOnline: true,
    ),
    _ConversationData(
      id: '2',
      name: 'Nguyễn Văn A',
      avatar: 'NA',
      avatarColor: const Color(0xFF41B339),
      lastMessage: 'Đã gửi file báo cáo cho bạn',
      time: '09:45',
      unreadCount: 0,
      isGroup: false,
      isOnline: true,
    ),
    _ConversationData(
      id: '3',
      name: 'Dự án RTC ERP',
      avatar: 'PR',
      avatarColor: const Color(0xFFEE4623),
      lastMessage: 'Trần Thị Bình: Code review xong rồi nhé!',
      time: 'Hôm qua',
      unreadCount: 7,
      isGroup: true,
      isOnline: false,
    ),
    _ConversationData(
      id: '4',
      name: 'Lê Hoàng B',
      avatar: 'LC',
      avatarColor: const Color(0xFFF0891A),
      lastMessage: 'Cảm ơn bạn đã phản hồi nhanh',
      time: 'Hôm qua',
      unreadCount: 0,
      isGroup: false,
      isOnline: false,
    ),
    _ConversationData(
      id: '5',
      name: 'Phòng Kỹ thuật',
      avatar: 'KT',
      avatarColor: const Color(0xFF853EFD),
      lastMessage: 'Lịch họp team buổi sáng: 9h00',
      time: '2 ngày',
      unreadCount: 1,
      isGroup: true,
      isOnline: true,
    ),
    _ConversationData(
      id: '6',
      name: 'Phạm Thị D',
      avatar: 'PD',
      avatarColor: const Color(0xFF2F80ED),
      lastMessage: 'Bạn có thể kiểm tra lại không?',
      time: '3 ngày',
      unreadCount: 0,
      isGroup: false,
      isOnline: false,
    ),
    _ConversationData(
      id: '7',
      name: 'Phòng Kinh doanh',
      avatar: 'KD',
      avatarColor: const Color(0xFFE91E63),
      lastMessage: 'Báo cáo doanh thu tháng đã được cập nhật',
      time: 'Tuần trước',
      unreadCount: 0,
      isGroup: true,
      isOnline: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<_ConversationData> get _filteredConversations {
    final tabIndex = _tabController.index;
    var list = _allConversations.where((c) {
      if (_searchQuery.isNotEmpty) {
        return c.name.toLowerCase().contains(_searchQuery.toLowerCase());
      }
      if (tabIndex == 1) return !c.isGroup;
      if (tabIndex == 2) return c.isGroup;
      return true;
    }).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Tin nhắn',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isSearchVisible ? Icons.close_outlined : Icons.search_outlined,
              color: AppColors.heading,
              size: 26,
            ),
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
                if (!_isSearchVisible) {
                  _searchQuery = '';
                  _searchController.clear();
                }
              });
            },
          ),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Column(
            children: [
              // Thanh tìm kiếm (ẩn/hiện)
              if (_isSearchVisible)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm cuộc trò chuyện...',
                      hintStyle: const TextStyle(
                        color: AppColors.hintText,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                        color: AppColors.hintText,
                        size: 22,
                      ),
                      filled: true,
                      fillColor: AppColors.bgCard,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.trim();
                      });
                    },
                  ),
                ),

              // Tabs
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primaryERP,
                unselectedLabelColor: AppColors.gray,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                indicatorColor: AppColors.primaryERP,
                indicatorWeight: 2.5,
                dividerColor: Colors.transparent,
                onTap: (_) => setState(() {}),
                tabs: const [
                  Tab(text: 'Tất cả'),
                  Tab(text: 'Cá nhân'),
                  Tab(text: 'Nhóm'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildConversationList(),
          _buildConversationList(),
          _buildConversationList(),
        ],
      ),
    );
  }

  Widget _buildConversationList() {
    final list = _filteredConversations;

    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: AppColors.gray.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isNotEmpty
                  ? 'Không tìm thấy cuộc trò chuyện'
                  : 'Chưa có tin nhắn nào',
              style: const TextStyle(
                color: AppColors.gray,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 6),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final conv = list[index];
        return _ConversationTile(
          data: conv,
          onTap: () => _openChat(context, conv),
        );
      },
    );
  }

  void _openChat(BuildContext context, _ConversationData conv) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatScreen(
          name: conv.name,
          avatar: conv.avatar,
          avatarColor: conv.avatarColor,
          isGroup: conv.isGroup,
          isOnline: conv.isOnline,
        ),
      ),
    );
  }
}

/// Dữ liệu mock cho một cuộc trò chuyện.
class _ConversationData {
  final String id;
  final String name;
  final String avatar;
  final Color avatarColor;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isGroup;
  final bool isOnline;

  const _ConversationData({
    required this.id,
    required this.name,
    required this.avatar,
    required this.avatarColor,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.isGroup,
    required this.isOnline,
  });
}

/// Item hiển thị một cuộc trò chuyện trong danh sách.
///
/// Gồm: avatar tròn + tên + tin nhắn gần nhất + thời gian + badge số tin chưa đọc.
class _ConversationTile extends StatelessWidget {
  final _ConversationData data;
  final VoidCallback onTap;

  const _ConversationTile({
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xFFE8EAF0), width: 0.5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar với trạng thái online/offline
            Stack(
              clipBehavior: Clip.none,
              children: [
                _AvatarCircle(
                  text: data.avatar,
                  color: data.avatarColor,
                  size: 50,
                ),
                if (data.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        color: const Color(0xFF41B339),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 12),

            // Nội dung: tên + tin nhắn
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (data.isGroup)
                        const Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(
                            Icons.group_outlined,
                            size: 14,
                            color: AppColors.gray,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          data.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: data.unreadCount > 0
                                ? FontWeight.w700
                                : FontWeight.w600,
                            color: AppColors.heading,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.lastMessage,
                    style: TextStyle(
                      fontSize: 13,
                      color: data.unreadCount > 0
                          ? AppColors.heading
                          : AppColors.gray,
                      fontWeight: data.unreadCount > 0
                          ? FontWeight.w500
                          : FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Thời gian + badge
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: data.unreadCount > 0
                        ? AppColors.primaryERP
                        : AppColors.gray,
                    fontWeight: data.unreadCount > 0
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                if (data.unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      data.unreadCount > 99
                          ? '99+'
                          : data.unreadCount.toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 19),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Avatar tròn chứa chữ viết tắt tên.
class _AvatarCircle extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const _AvatarCircle({
    required this.text,
    required this.color,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.34,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
