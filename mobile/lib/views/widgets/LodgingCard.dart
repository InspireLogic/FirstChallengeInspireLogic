import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'buttons/BookButton.dart';
import '../pages/LodgingDetailPage.dart';

class LodgingCard extends StatelessWidget {
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final double price;
  final VoidCallback onPressed;

  const LodgingCard({
    super.key,
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.price,
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

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A3E6C),
                  ),
                ),

                const SizedBox(height: 8),

                // Location
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: Color(0xFF1A3E6C),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Description
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

                // Price and button
                Row(
                  children: [
                    // Price
                    Text(
                      '\$${price.toStringAsFixed(0)} / night',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A3E6C),
                      ),
                    ),
                    const Spacer(),
                    // Button
                    BookButton(
                      onPressed: () {
                        // Navigate to details page with the current lodging data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => LodgingDetailPage(
                                  title: title,
                                  description: description,
                                  location: location,
                                  imageUrl: imageUrl,
                                  price: price,
                                ),
                          ),
                        );
                      },
                      text: 'BOOK NOW',
                      small: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
