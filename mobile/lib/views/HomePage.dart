import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'widgets/OptionCard.dart';
import 'widgets/DestinationCard.dart';
import 'widgets/buttons/BookButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem principal com texto sobreposto
            Stack(
              alignment: Alignment.center,
              children: [
                // Imagem de fundo
                SizedBox(
                  height: 300,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
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
                Container(height: 300, color: Colors.black.withOpacity(0.4)),
                // Text and button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Plan the perfect winter trip',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Easily plan your ideal ski trip from home with the help of professionals',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      BookButton(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Options section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Options',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Options grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.5,
                    children: const [
                      OptionCard(
                        title: 'Regions',
                        imageUrl:
                            'https://images.unsplash.com/photo-1613238906889-26b3eb9cf9a7?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        routeName: '/regions',
                      ),
                      OptionCard(
                        title: 'Lodging',
                        imageUrl:
                            'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                        routeName: '/lodgings',
                      ),
                      OptionCard(
                        title: 'Resorts',
                        imageUrl:
                            'https://images.unsplash.com/photo-1550503736-c1a2c9033c03?q=80&w=1481&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        routeName: '/resorts',
                      ),
                      OptionCard(
                        title: 'Passes',
                        imageUrl:
                            'https://images.unsplash.com/photo-1605540436563-5bca919ae766?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2669&q=80',
                        routeName: '/passes',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Additional CTA button
                  BookButton(onPressed: () {}),
                ],
              ),
            ),

            // Destaques
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Destinations',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Destinos em destaque
                  const DestinationCard(
                    title: 'Alps, Switzerland',
                    description:
                        'Experience world-class skiing in the heart of Europe',
                    imageUrl:
                        'https://plus.unsplash.com/premium_photo-1689084892324-fd8822cb97c1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),

                  const SizedBox(height: 16),

                  const DestinationCard(
                    title: 'Aspen, Colorado',
                    description:
                        'Luxury lodging and premium slopes for the ultimate experience',
                    imageUrl:
                        'https://images.unsplash.com/photo-1614444894791-c0c4d4286c35?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
