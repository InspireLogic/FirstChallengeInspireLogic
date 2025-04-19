import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const BookButton({
    super.key,
    required this.onPressed,
    this.text = 'BOOK HERE',
    this.width,
    this.padding,
  });

  @override
  State<BookButton> createState() => _BookButtonState();
}

class _BookButtonState extends State<BookButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          _controller.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _controller.reverse();
        });
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1A3E6C).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:
                  _isHovered
                      ? [const Color(0xFF2E8BC0), const Color(0xFF1A3E6C)]
                      : [const Color(0xFF3E9DD0), const Color(0xFF2E8BC0)],
            ),
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              padding:
                  widget.padding ?? const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color:
                        _isHovered
                            ? Colors.white.withOpacity(0.2)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.arrow_forward, size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
