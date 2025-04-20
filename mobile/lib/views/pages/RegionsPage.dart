import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/RegionCard.dart';
import '../widgets/buttons/BookButton.dart';

class RegionsPage extends StatefulWidget {
  const RegionsPage({super.key});

  @override
  State<RegionsPage> createState() => _RegionsPageState();
}

class _RegionsPageState extends State<RegionsPage> {
  final List<Map<String, dynamic>> _regionFilters = [
    {'name': 'All', 'isSelected': true},
    {'name': 'Europe', 'isSelected': false},
    {'name': 'North America', 'isSelected': false},
    {'name': 'Asia', 'isSelected': false},
    {'name': 'South America', 'isSelected': false},
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
                        'https://images.unsplash.com/photo-1485470733090-0aae1788d5af?q=80&w=2717&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                        'Explore Winter Destinations',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Discover top skiing and snowboarding regions around the world',
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
                    'Filter By Continent',
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
                          _regionFilters.map((filter) {
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
                                    for (var item in _regionFilters) {
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

            // Regions list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Regions',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RegionCard(
                    title: 'The Alps',
                    description:
                        'Home to some of the most iconic ski resorts in the world with perfect powder snow and breathtaking views.',
                    country: 'Switzerland',
                    imageUrl:
                        'https://images.unsplash.com/photo-1452784444945-3f422708fe5e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2672&q=80',
                    activities: ['Skiing', 'Snowboarding', 'Après-ski'],
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  RegionCard(
                    title: 'Rocky Mountains',
                    description:
                        'Featuring world-class powder, extensive terrain, and stunning mountain scenery across multiple states.',
                    country: 'USA',
                    imageUrl:
                        'https://images.unsplash.com/photo-1520095972714-909e91b038e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                    activities: ['Skiing', 'Snowboarding', 'Snowshoeing'],
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  RegionCard(
                    title: 'Patagonia',
                    description:
                        'South American winter destinations with stunning views of the Andes mountains and unique skiing experiences.',
                    country: 'Argentina',
                    imageUrl:
                        'https://images.unsplash.com/photo-1536323760109-ca8c07450053?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                    activities: ['Skiing', 'Mountaineering', 'Wildlife Tours'],
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
                    'Need help planning your trip?',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 12),
                  BookButton(
                    text: 'GET TRAVEL ADVICE',
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
