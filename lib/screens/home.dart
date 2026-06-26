import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F2937),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout_outlined, color: Colors.redAccent),
          ),
          const SizedBox(width: 8),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Track your daily engineering progress",
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  color: const Color(0xFF4B5563),
                ),
              ),
              const SizedBox(height: 24),
              _buildMetricCard("Active Projects", "8", Icons.folder_open, const Color(0xFF8B5CF6)),
              const SizedBox(height: 12),
              _buildMetricCard("Completed Tasks", "34", Icons.task_alt, const Color(0xFFD946EF)),
              const SizedBox(height: 12),
              _buildMetricCard("Hours Logged", "148h", Icons.av_timer, const Color(0xFF06B6D4)),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black.withOpacity(0.08)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Weekly Productivity",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 200,
                      child: CustomPaint(
                        painter: ChartPainter(),
                        size: Size.infinite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black.withOpacity(0.55), fontSize: 13),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.montserrat(
                  color: const Color(0xFF1F2937),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.black.withOpacity(0.05)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final xStep = size.width / 6;
    for (int i = 0; i <= 6; i++) {
      canvas.drawLine(Offset(i * xStep, 0), Offset(i * xStep, size.height), gridPaint);
    }
    const yLines = 4;
    final yStep = size.height / yLines;
    for (int i = 0; i <= yLines; i++) {
      canvas.drawLine(Offset(0, i * yStep), Offset(size.width, i * yStep), gridPaint);
    }

    final points = [
      Offset(0, size.height * 0.8),
      Offset(xStep, size.height * 0.6),
      Offset(xStep * 2, size.height * 0.7),
      Offset(xStep * 3, size.height * 0.4),
      Offset(xStep * 4, size.height * 0.5),
      Offset(xStep * 5, size.height * 0.2),
      Offset(xStep * 6, size.height * 0.3),
    ];

    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    final linePaint = Paint()
      ..color = const Color(0xFF8B5CF6)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, linePaint);

    final fillPath = Path()
      ..moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      fillPath.lineTo(points[i].dx, points[i].dy);
    }
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [const Color(0xFF8B5CF6).withOpacity(0.2), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);

    final dotPaint = Paint()
      ..color = const Color(0xFFD946EF)
      ..style = PaintingStyle.fill;

    for (final pt in points) {
      canvas.drawCircle(pt, 5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
