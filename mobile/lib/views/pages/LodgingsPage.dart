import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/LodgingCard.dart';
import '../widgets/buttons/BookButton.dart';

class LodgingsPage extends StatefulWidget {
  const LodgingsPage({super.key});

  @override
  State<LodgingsPage> createState() => _LodgingsPageState();
}

class _LodgingsPageState extends State<LodgingsPage> {
  final List<Map<String, dynamic>> _lodgingFilters = [
    {'name': 'All', 'isSelected': true},
    {'name': 'Hotel', 'isSelected': false},
    {'name': 'Resort', 'isSelected': false},
    {'name': 'Chalet', 'isSelected': false},
    {'name': 'Cabin', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner principal
            Stack(
              alignment: Alignment.center,
              children: [
                // Imagem de fundo
                SizedBox(
                  height: 250,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1548873902-8b69fb85030a?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                // Camada escura para melhorar legibilidade do texto
                Container(height: 250, color: Colors.black.withOpacity(0.4)),
                // Textos e botão
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Premium Accommodations',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Find the perfect place to stay during your winter vacation',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // Botão de voltar
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

            // Filtros
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter By Type',
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
                          _lodgingFilters.map((filter) {
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
                                    for (var item in _lodgingFilters) {
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

            // Lista de hospedagens
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Lodgings',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 16),
                  LodgingCard(
                    title: 'Alpine Luxury Hotel',
                    description:
                        'Luxurious accommodations with breathtaking mountain views, spa, and fine dining.',
                    location: 'Zermatt, Switzerland',
                    imageUrl:
                        'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                    price: 450,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  LodgingCard(
                    title: 'Mountain View Chalet',
                    description:
                        'Cozy wooden chalet with fireplace, ski-in/ski-out access, and private hot tub.',
                    location: 'Aspen, Colorado',
                    imageUrl:
                        'https://images.unsplash.com/photo-1520984032042-162d526883e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                    price: 320,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  LodgingCard(
                    title: 'Ski Resort Suite',
                    description:
                        'All-inclusive resort with spacious suites, world-class dining, and direct lift access.',
                    location: 'Whistler, Canada',
                    imageUrl:
                        'https://images.unsplash.com/photo-1613977257363-707ba9348227?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                    price: 550,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  LodgingCard(
                    title: 'Rustic Mountain Cabin',
                    description:
                        'Authentic mountain experience with modern amenities, perfect for families.',
                    location: 'Chamonix, France',
                    imageUrl:
                        'https://images.unsplash.com/photo-1553881651-43348b2ca74e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                    price: 280,
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
                    'Looking for a custom package?',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 12),
                  BookButton(
                    text: 'CONTACT US',
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
