import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/PassCard.dart';
import '../widgets/buttons/BookButton.dart';

class PassesPage extends StatefulWidget {
  const PassesPage({super.key});

  @override
  State<PassesPage> createState() => _PassesPageState();
}

class _PassesPageState extends State<PassesPage> {
  final List<Map<String, dynamic>> _passFilters = [
    {'name': 'All', 'isSelected': true},
    {'name': '1-3 Days', 'isSelected': false},
    {'name': '5-7 Days', 'isSelected': false},
    {'name': 'Season', 'isSelected': false},
    {'name': 'Family', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Main banner
            Stack(
              alignment: Alignment.center,
              children: [
                // Background image
                SizedBox(
                  height: 250,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1492724724894-7464c27d0ceb?q=80&w=2674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder:
                        (context, url) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.error),
                        ),
                  ),
                ),
                // Dark overlay to improve text readability
                Container(height: 250, color: Colors.black.withOpacity(0.4)),
                // Text and button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ski & Snowboard Passes',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Get unlimited access to the best slopes with our premium passes',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // Back button
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.7),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF1A3E6C),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            // Filters
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter By Duration',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          _passFilters.map((filter) {
                            final isSelected = filter['isSelected'] as bool;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: FilterChip(
                                label: Text(filter['name']),
                                selected: isSelected,
                                selectedColor: const Color(
                                  0xFF1A3E6C,
                                ).withOpacity(0.2),
                                checkmarkColor: const Color(0xFF1A3E6C),
                                labelStyle: GoogleFonts.montserrat(
                                  color:
                                      isSelected
                                          ? const Color(0xFF1A3E6C)
                                          : Colors.grey[800],
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                ),
                                onSelected: (selected) {
                                  setState(() {
                                    // Desmarcar todos os filtros primeiro
                                    for (var item in _passFilters) {
                                      item['isSelected'] = false;
                                    }
                                    // Selecionar o filtro atual
                                    filter['isSelected'] = selected;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Passes list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Passes',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 16),
                  PassCard(
                    title: 'Winter Vacation Pass',
                    description:
                        'For those planning an extended stay. The perfect week-long mountain experience.',
                    imageUrl:
                        'https://images.unsplash.com/photo-1605540436563-5bca919ae766?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2669&q=80',
                    price: 499,
                    duration: 7,
                    benefits: [
                      'Seven consecutive days of access',
                      'Premium equipment storage',
                      'Two free group lessons',
                      '15% off equipment rental',
                      'VIP access to resort facilities',
                      'Mountain dining credit',
                    ],
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  PassCard(
                    title: 'Season Ultimate Pass',
                    description:
                        'For the true enthusiast. Unlimited access throughout the winter season.',
                    imageUrl:
                        'https://images.unsplash.com/photo-1517242810446-cc8951b2be40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80',
                    price: 1299,
                    duration: 120,
                    benefits: [
                      'Full season access to all slopes',
                      'Priority lift access',
                      'Dedicated equipment storage',
                      'Unlimited group lessons',
                      '25% off private lessons',
                      'Resort-wide discounts',
                      'Access to exclusive events',
                      'Free parking',
                    ],
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Call to action
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Looking for custom options?',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 12),
                  BookButton(
                    text: 'CONTACT SALES',
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
