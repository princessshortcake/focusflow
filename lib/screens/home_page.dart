import 'package:flutter/material.dart';

enum AvatarType { neutral, female, male }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AvatarType _avatar = AvatarType.neutral;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 84, 37, 37),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: GestureDetector(
          onTap: _showAvatarSelection,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: Icon(
                _avatar == AvatarType.neutral
                    ? Icons.person
                    : _avatar == AvatarType.female
                    ? Icons.female
                    : Icons.male,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: const Text(
          'Russel Sprout',
          style: TextStyle(color: Color(0xFFF87575), fontSize: 18),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.group_outlined),
            color: Colors.white70,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.eco_outlined),
            color: Colors.white70,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.emoji_events_outlined),
            color: Colors.white70,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart_outlined),
            color: Colors.white70,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white70,
            onPressed: () {
              Navigator.pushNamed(context, '/logout');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          _buildTaskTile(Icons.wb_sunny_outlined, 'Today', '1h 15m 5'),
          _buildTaskTile(Icons.bedtime_outlined, 'Tomorrow', '0m 0'),
          _buildTaskTile(
            Icons.calendar_month_outlined,
            'This Week',
            '1h 15m 5',
          ),
          _buildTaskTile(Icons.event_note_outlined, 'Planned', '1h 15m 5'),
          _buildTaskTile(Icons.event_outlined, 'Events', '1h 15m 5'),
          _buildTaskTile(Icons.check_circle_outline, 'Completed', '1h 15m 5'),
          _buildTaskTile(Icons.task_outlined, 'Tasks', '1h 15m 5'),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.add, color: Color(0xFFF87575)),
            title: const Text(
              '+ Add Project',
              style: TextStyle(color: Color(0xFFF87575)),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.label_outline, color: Colors.white70),
                SizedBox(width: 16),
                Icon(Icons.create_new_folder_outlined, color: Colors.white70),
              ],
            ),
            onTap: () {},
          ),
          const SizedBox(height: 40),
          // Pomodoro timer
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[850],
              ),
              child: const Center(
                child: Text(
                  '25',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTile(IconData icon, String label, String time) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing: Text(time, style: const TextStyle(color: Colors.white70)),
      onTap: () {},
    );
  }

  void _showAvatarSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2C2C2C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white70),
              title: const Text(
                'Neutral',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                setState(() => _avatar = AvatarType.neutral);
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.female, color: Colors.white70),
              title: const Text(
                'Female',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                setState(() => _avatar = AvatarType.female);
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.male, color: Colors.white70),
              title: const Text('Male', style: TextStyle(color: Colors.white)),
              onTap: () {
                setState(() => _avatar = AvatarType.male);
                Navigator.pop(ctx);
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
