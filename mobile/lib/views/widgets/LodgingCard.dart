import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'buttons/BookButton.dart';

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
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                // Preço e botão
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(0)}/night',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A3E6C),
                      ),
                    ),
                    BookButton(
                      onPressed: onPressed,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
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
