import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'buttons/BookButton.dart';

class ResortCard extends StatelessWidget {
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final int rating;
  final List<String> amenities;
  final VoidCallback onPressed;

  const ResortCard({
    super.key,
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.amenities,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Container(
                      color: Colors.grey[300],
                      height: 180,
                      width: double.infinity,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      color: Colors.grey[300],
                      height: 180,
                      width: double.infinity,
                      child: const Icon(Icons.error),
                    ),
              ),
              // Rating badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A3E6C).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '$rating/5',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Título
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A3E6C),
                  ),
                ),

                const SizedBox(height: 4),

                // Localização
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Descrição
                Text(
                  description,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                // Amenities
                SizedBox(
                  height: 36,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: amenities.length,
                    separatorBuilder:
                        (context, index) => const VerticalDivider(
                          color: Colors.grey,
                          width: 16,
                          thickness: 1,
                          indent: 8,
                          endIndent: 8,
                        ),
                    itemBuilder: (context, index) {
                      final amenity = amenities[index];

                      IconData icon = Icons.spa;
                      if (amenity.contains('Lift')) {
                        icon = Icons.elevator;
                      } else if (amenity.contains('Restaurant')) {
                        icon = Icons.restaurant;
                      } else if (amenity.contains('Spa')) {
                        icon = Icons.spa;
                      } else if (amenity.contains('Pool')) {
                        icon = Icons.pool;
                      } else if (amenity.contains('Wifi')) {
                        icon = Icons.wifi;
                      } else if (amenity.contains('Lessons')) {
                        icon = Icons.school;
                      }

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(icon, size: 16, color: const Color(0xFF1A3E6C)),
                          const SizedBox(width: 4),
                          Text(
                            amenity,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: const Color(0xFF1A3E6C),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),

                // Botão
                BookButton(
                  onPressed: onPressed,
                  text: 'VIEW RESORT',
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
