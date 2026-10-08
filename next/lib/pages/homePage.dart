import 'package:flutter/material.dart';
import 'inboxPage.dart';
import 'profilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    _HomeContent(),
    _HomeContent(), // Today — same layout
    InboxPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFEEEEEE), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF5B6BF5),
          unselectedItemColor: const Color(0xFFBDBDBD),
          selectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined),
              activeIcon: Icon(Icons.today),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox_outlined),
              activeIcon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Home Content ─────────────────────────────────────────────────────────────

class _HomeContent extends StatefulWidget {
  const _HomeContent();

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  bool _todayExpanded = true;
  bool _apr30Expanded = true;

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
                      // Avatar "FR"
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
                        icon: const Icon(Icons.notifications_none_outlined,
                            size: 22, color: Color(0xFF555555)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sentiment_satisfied_alt_outlined,
                            size: 22, color: Color(0xFF555555)),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Greeting ──
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Morning, Ralph',
                        style: TextStyle(
                          color: Color(0xFF1A1A2E),
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'April 27, 2026',
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Search bar ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 16),
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

              // ── Today section ──
              SliverToBoxAdapter(
                child: _SectionHeader(
                  title: 'Today (3)',
                  expanded: _todayExpanded,
                  onTap: () =>
                      setState(() => _todayExpanded = !_todayExpanded),
                ),
              ),
              if (_todayExpanded)
                SliverToBoxAdapter(
                  child: Column(
                    children: const [
                      _TaskCard(
                        title: 'Design Wireframe',
                        time: 'Friday 08:00 AM - 09:00 AM',
                        status: TaskStatus.inProgress,
                      ),
                      _TaskCard(
                        title: 'Meet with client',
                        time: 'Friday 10:00 AM - 11:00 AM',
                        status: TaskStatus.pending,
                      ),
                      _TaskCard(
                        title: "April's content selection",
                        subtitle: "In april's content selection...",
                        time: '',
                        status: TaskStatus.highlighted,
                      ),
                    ],
                  ),
                ),

              // ── 30 Apr section ──
              SliverToBoxAdapter(
                child: _SectionHeader(
                  title: '30 Apr (1)',
                  expanded: _apr30Expanded,
                  onTap: () =>
                      setState(() => _apr30Expanded = !_apr30Expanded),
                ),
              ),
              if (_apr30Expanded)
                SliverToBoxAdapter(
                  child: Column(
                    children: const [
                      _TaskCard(
                        title: 'Brainstorming session - ideas',
                        time: 'Saturday 08:00 AM - 17:00 PM',
                        status: TaskStatus.done,
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

// ─── Section Header ───────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final bool expanded;
  final VoidCallback onTap;

  const _SectionHeader({
    required this.title,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1A1A2E),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              expanded
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_right,
              size: 18,
              color: const Color(0xFF9E9E9E),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Task Card ────────────────────────────────────────────────────────────────

enum TaskStatus { inProgress, pending, done, highlighted }

class _TaskCard extends StatelessWidget {
  final String title;
  final String time;
  final String? subtitle;
  final TaskStatus status;

  const _TaskCard({
    required this.title,
    required this.time,
    required this.status,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isHighlighted = status == TaskStatus.highlighted;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isHighlighted
            ? const Color(0xFFEEF0FF)
            : Colors.white,
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
          // Status indicator
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: _StatusIcon(status: status),
          ),
          const SizedBox(width: 12),
          // Content
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
                      color: Color(0xFF9E9E9E),
                      fontSize: 12,
                    ),
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
                          color: Color(0xFFBDBDBD),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          // Edit icon
          const Icon(Icons.edit_outlined,
              size: 16, color: Color(0xFFBDBDBD)),
        ],
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final TaskStatus status;

  const _StatusIcon({required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case TaskStatus.inProgress:
        return Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color(0xFFFF7043), width: 2),
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
      case TaskStatus.pending:
        return Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: const Color(0xFFBDBDBD), width: 2),
          ),
        );
      case TaskStatus.done:
        return const Icon(Icons.check_circle,
            size: 18, color: Color(0xFF4CAF50));
      case TaskStatus.highlighted:
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
