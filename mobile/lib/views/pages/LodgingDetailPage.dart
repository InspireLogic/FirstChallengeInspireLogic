import 'package:challenge_inspire_logic/views/widgets/txtFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/buttons/BookButton.dart';

class LodgingDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final double price;

  const LodgingDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.price,
  });

  @override
  State<LodgingDetailPage> createState() => _LodgingDetailPageState();
}

class _LodgingDetailPageState extends State<LodgingDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  late DateTime _checkInDate;
  late DateTime _checkOutDate;
  int _guests = 2;
  String _selectedRoom = 'Standard';
  final List<String> _roomTypes = ['Standard', 'Deluxe', 'Suite', 'Family'];

  @override
  void initState() {
    super.initState();
    _checkInDate = DateTime.now().add(const Duration(days: 7));
    _checkOutDate = _checkInDate.add(const Duration(days: 3));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate number of nights
    final nights = _checkOutDate.difference(_checkInDate).inDays;
    // Calculate total price
    double totalPrice = widget.price * nights;
    // Add room type premium
    if (_selectedRoom == 'Deluxe') {
      totalPrice *= 1.25; // 25% premium
    } else if (_selectedRoom == 'Suite') {
      totalPrice *= 1.5; // 50% premium
    } else if (_selectedRoom == 'Family') {
      totalPrice *= 1.75; // 75% premium
    }

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
                  height: 200,
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
                Container(height: 200, color: Colors.black.withOpacity(0.4)),
                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
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

            // Lodging details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location & Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xFF1A3E6C),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.location,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1A3E6C),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${widget.price.toStringAsFixed(0)} / night',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A3E6C),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    widget.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Property images
                  Text(
                    'Property Images',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:
                          [
                                widget.imageUrl,
                                'https://images.unsplash.com/photo-1590490360182-c33d57733427?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80',
                                'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
                                'https://images.unsplash.com/photo-1586105251261-72a756497a11?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2658&q=80',
                              ]
                              .map(
                                (imageUrl) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: imageUrl,
                                      height: 100,
                                      width: 150,
                                      fit: BoxFit.cover,
                                      placeholder:
                                          (context, url) => Container(
                                            color: Colors.grey[300],
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                      errorWidget:
                                          (context, url, error) => Container(
                                            color: Colors.grey[300],
                                            child: const Icon(Icons.error),
                                          ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Booking form
                  Text(
                    'Booking Information',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        TxtFormField(
                          controller: _nameController,
                          hintText: 'Full Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Email
                        TxtFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          inputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Basic email validation
                            if (!value.contains('@') || !value.contains('.')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Phone
                        TxtFormField(
                          controller: _phoneController,
                          hintText: 'Phone Number',
                          inputType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Dates row
                        Row(
                          children: [
                            // Check-in date
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: _checkInDate,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 365),
                                    ),
                                  );
                                  if (picked != null &&
                                      picked != _checkInDate) {
                                    setState(() {
                                      _checkInDate = picked;
                                      // Ensure check-out is after check-in
                                      if (_checkOutDate.isBefore(
                                            _checkInDate,
                                          ) ||
                                          _checkOutDate.isAtSameMomentAs(
                                            _checkInDate,
                                          )) {
                                        _checkOutDate = _checkInDate.add(
                                          const Duration(days: 1),
                                        );
                                      }
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Check-in',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${_checkInDate.day}/${_checkInDate.month}/${_checkInDate.year}',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Check-out date
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: _checkOutDate,
                                    firstDate: _checkInDate.add(
                                      const Duration(days: 1),
                                    ),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 365),
                                    ),
                                  );
                                  if (picked != null &&
                                      picked != _checkOutDate) {
                                    setState(() {
                                      _checkOutDate = picked;
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Check-out',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${_checkOutDate.day}/${_checkOutDate.month}/${_checkOutDate.year}',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Guests
                        Row(
                          children: [
                            Text(
                              'Guests:',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {
                                if (_guests > 1) {
                                  setState(() {
                                    _guests--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove_circle_outline),
                              color: const Color(0xFF1A3E6C),
                            ),
                            Text(
                              _guests.toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _guests++;
                                });
                              },
                              icon: const Icon(Icons.add_circle_outline),
                              color: const Color(0xFF1A3E6C),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Room type
                        Text(
                          'Room Type:',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedRoom,
                              isExpanded: true,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              items:
                                  _roomTypes.map((String type) {
                                    return DropdownMenuItem<String>(
                                      value: type,
                                      child: Text(
                                        type,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selectedRoom = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Booking summary
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking Summary',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1A3E6C),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$nights nights (${widget.price.toStringAsFixed(0)}/night)',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    '\$${(widget.price * nights).toStringAsFixed(0)}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$_selectedRoom room',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    _selectedRoom == 'Standard'
                                        ? 'Included'
                                        : _selectedRoom == 'Deluxe'
                                        ? '+25%'
                                        : _selectedRoom == 'Suite'
                                        ? '+50%'
                                        : '+75%',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total:',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1A3E6C),
                                    ),
                                  ),
                                  Text(
                                    '\$${totalPrice.toStringAsFixed(0)}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1A3E6C),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Submit button
                        BookButton(
                          text: 'BOOK NOW',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Show success dialog
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text(
                                        'Booking Successful',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF1A3E6C),
                                        ),
                                      ),
                                      content: Text(
                                        'Thank you for your booking! A confirmation email has been sent to ${_emailController.text}.',
                                        style: GoogleFonts.montserrat(),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(
                                              context,
                                            ).pop(); // Close dialog
                                            Navigator.of(
                                              context,
                                            ).pop(); // Return to previous screen
                                          },
                                          child: Text(
                                            'OK',
                                            style: GoogleFonts.montserrat(
                                              color: const Color(0xFF1A3E6C),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              );
                            }
                          },
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ],
                    ),
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
