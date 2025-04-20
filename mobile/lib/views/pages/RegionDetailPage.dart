import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/buttons/BookButton.dart';
import '../widgets/LodgingCard.dart';
import '../widgets/ResortCard.dart';

class RegionDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String country;
  final String imageUrl;
  final List<String> activities;

  const RegionDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.country,
    required this.imageUrl,
    required this.activities,
  });

  @override
  State<RegionDetailPage> createState() => _RegionDetailPageState();
}

class _RegionDetailPageState extends State<RegionDetailPage> {
  int _currentTabIndex = 0;
  final List<String> _tabs = ['Overview', 'Resorts', 'Lodging', 'Activities'];

  // Moved activityDetails map here to be accessible in the build method
  final Map<String, Map<String, dynamic>> _activityDetails = {
    'Skiing': {
      'image':
          'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
      'description':
          'Experience world-class skiing on perfectly groomed slopes with breathtaking mountain views.',
    },
    'Snowboarding': {
      'image':
          'https://images.unsplash.com/photo-1523731407965-2430cd12f5e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
      'description':
          'Ride the powder on dedicated snowboarding terrain with half-pipes and terrain parks.',
    },
    'Après-ski': {
      'image':
          'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2669&q=80',
      'description':
          'Enjoy the vibrant nightlife with local cuisine, live music, and entertainment after a day on the slopes.',
    },
    'Snowshoeing': {
      'image':
          'https://images.unsplash.com/photo-1551632811-561732d1e306?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
      'description':
          'Explore pristine winter landscapes on guided snowshoe tours through scenic mountain trails.',
    },
    'Hot Springs': {
      'image':
          'https://images.unsplash.com/photo-1515362655824-9a74989f318e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
      'description':
          'Relax and rejuvenate in natural hot springs while surrounded by snow-covered mountains.',
    },
    'Winter Festivals': {
      'image':
          'https://images.unsplash.com/photo-1551025078-7a4e8020c9ca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
      'description':
          'Participate in local cultural celebrations with music, food, and traditional winter activities.',
    },
    'Mountaineering': {
      'image':
          'https://images.unsplash.com/photo-1551632811-561732d1e306?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
      'description':
          'Challenge yourself with guided mountaineering expeditions for all skill levels.',
    },
    'Wildlife Tours': {
      'image':
          'https://images.unsplash.com/photo-1516046248141-a8510fff7a67?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80',
      'description':
          'Observe local wildlife in their natural winter habitat with experienced guides.',
    },
    'Powder Skiing': {
      'image':
          'https://images.unsplash.com/photo-1605540436563-5bca919ae766?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2669&q=80',
      'description':
          'Experience the thrill of skiing through fresh, deep powder snow on untouched slopes.',
    },
  };

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
                    imageUrl: widget.imageUrl,
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
                // Title and country
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A3E6C).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.country,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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

            // Tabs
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children:
                    _tabs.asMap().entries.map((entry) {
                      final isSelected = _currentTabIndex == entry.key;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTabIndex = entry.key;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      isSelected
                                          ? const Color(0xFF1A3E6C)
                                          : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Text(
                              entry.value,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                color:
                                    isSelected
                                        ? const Color(0xFF1A3E6C)
                                        : Colors.grey[600],
                                fontWeight:
                                    isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),

            // Tab content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_currentTabIndex == 0) ...[
                    // Overview Tab
                    // Description
                    Text(
                      widget.description,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Region highlights
                    Text(
                      'Region Highlights',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A3E6C),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Grid of highlights
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                      children: [
                        // Inlined HighlightCard
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.landscape,
                                  color: Color(0xFF1A3E6C),
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Premium Slopes',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1A3E6C),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'World-class skiing and snowboarding terrain',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Inlined HighlightCard
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.ac_unit,
                                  color: Color(0xFF1A3E6C),
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Snow Quality',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1A3E6C),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Perfect powder snow throughout the season',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Inlined HighlightCard
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.photo_camera,
                                  color: Color(0xFF1A3E6C),
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Scenic Views',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1A3E6C),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Breathtaking mountain panoramas',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Inlined HighlightCard
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.local_bar,
                                  color: Color(0xFF1A3E6C),
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Après-Ski',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1A3E6C),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Vibrant nightlife and entertainment',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Activities
                    Text(
                      'Activities',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A3E6C),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Activity chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          widget.activities
                              .map(
                                (activity) => Chip(
                                  backgroundColor: const Color(
                                    0xFF1A3E6C,
                                  ).withOpacity(0.1),
                                  label: Text(
                                    activity,
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xFF1A3E6C),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  avatar: const Icon(
                                    Icons.star,
                                    color: Color(0xFF1A3E6C),
                                    size: 18,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                ),
                              )
                              .toList(),
                    ),

                    const SizedBox(height: 24),

                    // CTA
                    Center(
                      child: BookButton(
                        text: 'EXPLORE PACKAGES',
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ] else if (_currentTabIndex == 1) ...[
                    // Resorts Tab
                    Text(
                      'Top Resorts in ${widget.title}',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A3E6C),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // List of resorts
                    ResortCard(
                      title: 'Alpine Peak Resort',
                      description:
                          'Premium ski-in/ski-out resort with world-class amenities and stunning mountain views.',
                      location: '${widget.title}, ${widget.country}',
                      imageUrl:
                          'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                      rating: 5,
                      amenities: ['Ski Lifts', 'Spa', 'Restaurant'],
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),

                    ResortCard(
                      title: 'Mountain Lodge Resort',
                      description:
                          'Traditional mountain lodge with cozy atmosphere and direct access to pristine slopes.',
                      location: '${widget.title}, ${widget.country}',
                      imageUrl:
                          'https://images.unsplash.com/photo-1601599963565-b7f49beb6b5d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80',
                      rating: 4,
                      amenities: ['Pool', 'Wifi', 'Ski Lessons'],
                      onPressed: () {},
                    ),
                  ] else if (_currentTabIndex == 2) ...[
                    // Lodging Tab
                    Text(
                      'Lodging Options in ${widget.title}',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A3E6C),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // List of lodging options
                    LodgingCard(
                      title: 'Mountain View Chalet',
                      description:
                          'Cozy wooden chalet with fireplace, ski-in/ski-out access, and private hot tub.',
                      location: '${widget.title}, ${widget.country}',
                      imageUrl:
                          'https://images.unsplash.com/photo-1520984032042-162d526883e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                      price: 320,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),

                    LodgingCard(
                      title: 'Luxury Alpine Hotel',
                      description:
                          'Premium hotel rooms with mountain views, spa access, and gourmet dining options.',
                      location: '${widget.title}, ${widget.country}',
                      imageUrl:
                          'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                      price: 450,
                      onPressed: () {},
                    ),
                  ] else if (_currentTabIndex == 3) ...[
                    // Activities Tab
                    Text(
                      'Available Activities in ${widget.title}',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A3E6C),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // List of activities with descriptions
                    ...widget.activities.map((activity) {
                      // Inlined ActivityCard
                      final image =
                          _activityDetails[activity]?['image'] ??
                          'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80';
                      final description =
                          _activityDetails[activity]?['description'] ??
                          'Enjoy this popular winter activity in the beautiful setting of ${widget.title}.';

                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Activity image
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: image,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder:
                                    (context, url) => Container(
                                      color: Colors.grey[300],
                                      height: 150,
                                      width: double.infinity,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                errorWidget:
                                    (context, url, error) => Container(
                                      color: Colors.grey[300],
                                      height: 150,
                                      width: double.infinity,
                                      child: const Icon(Icons.error),
                                    ),
                              ),
                            ),

                            // Activity details
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1A3E6C),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    description,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),

                    const SizedBox(height: 24),

                    // CTA
                    Center(
                      child: BookButton(
                        text: 'BOOK ACTIVITIES',
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
