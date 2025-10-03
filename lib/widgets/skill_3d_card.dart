import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Skill3DCard extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String level;

  const Skill3DCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.level,
  });

  @override
  State<Skill3DCard> createState() => _Skill3DCardState();
}

class _Skill3DCardState extends State<Skill3DCard>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Color _getLevelColor() {
    switch (widget.level.toLowerCase()) {
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

  LinearGradient _getLevelGradient() {
    switch (widget.level.toLowerCase()) {
      case 'basic':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF10B981), Color(0xFF34D399)],
        );
      case 'intermediate':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)],
        );
      case 'advanced':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEC4899), Color(0xFFF472B6)],
        );
      default:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.lightBlue],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isHovered = true);
        _hoverController.forward();
      },
      onTapUp: (_) {
        setState(() => _isHovered = false);
        _hoverController.reverse();
      },
      onTapCancel: () {
        setState(() => _isHovered = false);
        _hoverController.reverse();
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([_hoverController, _pulseController]),
        builder: (context, child) {
          final scale = _isHovered ? _scaleAnimation.value : 1.0;
          final glowOpacity = _isHovered ? 0.8 : _glowAnimation.value * 0.3;

          return Transform.scale(
            scale: scale,
            child: Container(
              width: 180,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Stack(
                children: [
                  // Enhanced shadow layers for 3D depth
                  Positioned(
                    top: 12,
                    left: 6,
                    right: 6,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.15),
                            Colors.black.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Glow effect
                  Positioned(
                    top: 8,
                    left: 2,
                    right: 2,
                    bottom: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: _getLevelGradient(),
                        boxShadow: [
                          BoxShadow(
                            color: _getLevelColor().withOpacity(glowOpacity),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Main card
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.95),
                          Colors.white.withOpacity(0.85),
                          Colors.white.withOpacity(0.75),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _getLevelColor().withOpacity(0.2),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                          spreadRadius: -4,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Stack(
                        children: [
                          // Enhanced glassmorphism overlay
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(0.9),
                                    Colors.white.withOpacity(0.6),
                                    Colors.white.withOpacity(0.3),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Content
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Enhanced 3D Image container
                                Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: _getLevelGradient(),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.4),
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: _getLevelColor().withOpacity(0.5),
                                        blurRadius: 24,
                                        offset: const Offset(0, 10),
                                        spreadRadius: -2,
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.9),
                                        blurRadius: 12,
                                        offset: const Offset(-6, -6),
                                      ),
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 12,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          widget.imageUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                gradient: _getLevelGradient(),
                                              ),
                                              child: Icon(
                                                _getIconForSkill(widget.name),
                                                size: 56,
                                                color: Colors.white,
                                              ),
                                            );
                                          },
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return Container(
                                              decoration: BoxDecoration(
                                                gradient: _getLevelGradient(),
                                              ),
                                              child: Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress.expectedTotalBytes != null
                                                      ? loadingProgress.cumulativeBytesLoaded /
                                                          loadingProgress.expectedTotalBytes!
                                                      : null,
                                                  color: Colors.white,
                                                  strokeWidth: 3,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // Skill name with better typography
                                Text(
                                  widget.name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1F2937),
                                    letterSpacing: 0.5,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white.withOpacity(0.8),
                                        offset: const Offset(0, 1),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Enhanced level badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: _getLevelGradient(),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: _getLevelColor().withOpacity(0.4),
                                        blurRadius: 12,
                                        offset: const Offset(0, 3),
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.2),
                                        blurRadius: 6,
                                        offset: const Offset(-2, -2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    widget.level,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Enhanced shine effect
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(28),
                                  topRight: Radius.circular(28),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withOpacity(0.8),
                                    Colors.white.withOpacity(0.4),
                                    Colors.white.withOpacity(0.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getIconForSkill(String skillName) {
    final name = skillName.toLowerCase();
    if (name.contains('dribbl')) return Icons.sports_basketball;
    if (name.contains('vault')) return Icons.fitness_center;
    if (name.contains('agility')) return Icons.directions_run;
    if (name.contains('pass')) return Icons.sports_soccer;
    if (name.contains('shoot')) return Icons.sports_baseball;
    if (name.contains('ball control')) return Icons.sports_handball;
    if (name.contains('sprint')) return Icons.speed;
    if (name.contains('coordination')) return Icons.accessibility;
    if (name.contains('power')) return Icons.flash_on;
    if (name.contains('endurance')) return Icons.timer;
    return Icons.sports;
  }
}
