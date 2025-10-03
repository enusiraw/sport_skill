import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import '../models/skill.dart';
import '../widgets/skill_3d_card.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen>
    with TickerProviderStateMixin {
  late Map<String, List<Skill>> groupedSkills;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _loadAndGroupSkills();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _loadAndGroupSkills() {
    const jsonData = '''
    [
      {"name": "Dribbling", "level": "Basic", "image": "https://picsum.photos/200?random=1"},
      {"name": "Passing", "level": "Basic", "image": "https://picsum.photos/200?random=2"},
      {"name": "Ball Control", "level": "Basic", "image": "https://picsum.photos/200?random=3"},
      {"name": "Vault", "level": "Intermediate", "image": "https://picsum.photos/200?random=4"},
      {"name": "Sprint Training", "level": "Intermediate", "image": "https://picsum.photos/200?random=5"},
      {"name": "Coordination", "level": "Intermediate", "image": "https://picsum.photos/200?random=6"},
      {"name": "Agility", "level": "Advanced", "image": "https://picsum.photos/200?random=7"},
      {"name": "Power Moves", "level": "Advanced", "image": "https://picsum.photos/200?random=8"},
      {"name": "Endurance", "level": "Advanced", "image": "https://picsum.photos/200?random=9"}
    ]
    ''';

    final List<dynamic> jsonList = json.decode(jsonData);
    final List<Skill> skills = jsonList.map((json) => Skill.fromJson(json)).toList();

    groupedSkills = {
      'Basic': [],
      'Intermediate': [],
      'Advanced': [],
    };

    for (var skill in skills) {
      if (groupedSkills.containsKey(skill.level)) {
        groupedSkills[skill.level]!.add(skill);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0F172A), // Deep slate
              const Color(0xFF1E293B), // Slate 800
              const Color(0xFF312E81), // Indigo 900
              const Color(0xFF581C87), // Purple 900
              const Color(0xFF7C3AED), // Violet 600
              const Color(0xFFEC4899), // Pink 500
            ],
            stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Enhanced Header
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            const Color(0xFF7C3AED),
                            const Color(0xFFEC4899),
                            const Color(0xFFF59E0B),
                          ],
                        ).createShader(bounds),
                        child: Text(
                          'Skills Training',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 4),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Master your abilities step by step',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Skills carousels
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 24),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildLevelSection('Basic', groupedSkills['Basic']!),
                      const SizedBox(height: 32),
                      _buildLevelSection('Intermediate', groupedSkills['Intermediate']!),
                      const SizedBox(height: 32),
                      _buildLevelSection('Advanced', groupedSkills['Advanced']!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLevelSection(String level, List<Skill> skills) {
    if (skills.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 32,
                decoration: BoxDecoration(
                  gradient: _getLevelGradient(level),
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: _getLevelColor(level).withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ShaderMask(
                  shaderCallback: (bounds) => _getLevelGradient(level)
                      .createShader(bounds),
                  child: Text(
                    level,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.25),
                      Colors.white.withOpacity(0.15),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '${skills.length} skills',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              final skill = skills[index];
              return Skill3DCard(
                name: skill.name,
                imageUrl: skill.image,
                level: skill.level,
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'basic':
        return const Color(0xFF10B981);
      case 'intermediate':
        return const Color(0xFFF59E0B);
      case 'advanced':
        return const Color(0xFFEC4899);
      default:
        return Colors.blue;
    }
  }

  LinearGradient _getLevelGradient(String level) {
    switch (level.toLowerCase()) {
      case 'basic':
        return const LinearGradient(
          colors: [Color(0xFF10B981), Color(0xFF34D399)],
        );
      case 'intermediate':
        return const LinearGradient(
          colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)],
        );
      case 'advanced':
        return const LinearGradient(
          colors: [Color(0xFFEC4899), Color(0xFFF472B6)],
        );
      default:
        return const LinearGradient(
          colors: [Colors.blue, Colors.lightBlue],
        );
    }
  }
}
