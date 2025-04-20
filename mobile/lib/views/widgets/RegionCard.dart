import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'buttons/BookButton.dart';
import '../pages/RegionDetailPage.dart';

class RegionCard extends StatelessWidget {
  final String title;
  final String description;
  final String country;
  final String imageUrl;
  final List<String> activities;
  final VoidCallback onPressed;

  const RegionCard({
    super.key,
    required this.title,
    required this.description,
    required this.country,
    required this.imageUrl,
    required this.activities,
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
          // Image
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
              // Country badge
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
                  child: Text(
                    country,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
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

                // Description
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

                // Activities
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children:
                      activities
                          .map(
                            (activity) => Chip(
                              backgroundColor: const Color(
                                0xFF1A3E6C,
                              ).withOpacity(0.1),
                              label: Text(
                                activity,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: const Color(0xFF1A3E6C),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),

                const SizedBox(height: 12),

                // Button
                BookButton(
                  onPressed: () {
                    // Navigate to details page with the current region data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => RegionDetailPage(
                              title: title,
                              description: description,
                              country: country,
                              imageUrl: imageUrl,
                              activities: activities,
                            ),
                      ),
                    );
                  },
                  text: 'EXPLORE REGION',
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
