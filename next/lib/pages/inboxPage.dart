import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ── Top bar ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5B6BF5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'FR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            Icons.notifications_none_outlined,
                            size: 22,
                            color: Color(0xFF555555)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            Icons.sentiment_satisfied_alt_outlined,
                            size: 22,
                            color: Color(0xFF555555)),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Search bar ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 4),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(Icons.search,
                            color: Color(0xFFBDBDBD), size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ── Task list ──
              SliverToBoxAdapter(
                child: Column(
                  children: const [
                    SizedBox(height: 12),
                    _InboxTaskCard(
                      title: 'Design Wireframe',
                      time: 'Friday 08:00 AM - 09:00 AM',
                      status: _InboxStatus.inProgress,
                    ),
                    _InboxTaskCard(
                      title: 'Meet with client',
                      time: 'Friday 10:00 AM - 11:00 AM',
                      status: _InboxStatus.pending,
                    ),
                    _InboxTaskCard(
                      title: "April's content selection",
                      subtitle: "In april's content selection...",
                      time: '',
                      status: _InboxStatus.highlighted,
                    ),
                    _InboxTaskCard(
                      title: 'Design Wireframe',
                      time: 'Friday 08:00 AM - 09:00 AM',
                      status: _InboxStatus.inProgress,
                    ),
                    _InboxTaskCard(
                      title: 'Meet with client',
                      time: 'Friday 10:00 AM - 11:00 AM',
                      status: _InboxStatus.pending,
                    ),
                    _InboxTaskCard(
                      title: 'Brainstorming session - ideas',
                      time: 'Saturday 08:00 AM - 17:00 PM',
                      status: _InboxStatus.done,
                    ),
                  ],
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),

          // ── FAB ──
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xFF5B6BF5),
              elevation: 4,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Inbox Task Card ──────────────────────────────────────────────────────────

enum _InboxStatus { inProgress, pending, done, highlighted }

class _InboxTaskCard extends StatelessWidget {
  final String title;
  final String time;
  final String? subtitle;
  final _InboxStatus status;

  const _InboxTaskCard({
    required this.title,
    required this.time,
    required this.status,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isHighlighted = status == _InboxStatus.highlighted;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFEEF0FF) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isHighlighted
              ? const Color(0xFFD0D4FF)
              : const Color(0xFFEEEEEE),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: _InboxStatusIcon(status: status),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isHighlighted
                        ? const Color(0xFF5B6BF5)
                        : const Color(0xFF1A1A2E),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: const TextStyle(
                        color: Color(0xFF9E9E9E), fontSize: 12),
                  ),
                ],
                if (time.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined,
                          size: 11, color: Color(0xFFBDBDBD)),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(
                            color: Color(0xFFBDBDBD), fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.edit_outlined,
              size: 16, color: Color(0xFFBDBDBD)),
        ],
      ),
    );
  }
}

class _InboxStatusIcon extends StatelessWidget {
  final _InboxStatus status;

  const _InboxStatusIcon({required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case _InboxStatus.inProgress:
        return Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: const Color(0xFFFF7043), width: 2),
          ),
          child: Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFF7043),
              ),
            ),
          ),
        );
      case _InboxStatus.pending:
        return Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color(0xFFBDBDBD), width: 2),
          ),
        );
      case _InboxStatus.done:
        return const Icon(Icons.check_circle,
            size: 18, color: Color(0xFF4CAF50));
      case _InboxStatus.highlighted:
        return Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFF5B6BF5).withOpacity(0.15),
            border: Border.all(
                color: const Color(0xFF5B6BF5), width: 1.5),
          ),
          child: const Icon(Icons.notes,
              size: 11, color: Color(0xFF5B6BF5)),
        );
    }
  }
}
