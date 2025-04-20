import 'package:challenge_inspire_logic/views/widgets/txtFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/buttons/BookButton.dart';

class PassDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final int duration;
  final List<String> benefits;

  const PassDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.duration,
    required this.benefits,
  });

  @override
  State<PassDetailPage> createState() => _PassDetailPageState();
}

class _PassDetailPageState extends State<PassDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  late DateTime _selectedDate;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now().add(const Duration(days: 7));
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
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
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

            // Pass details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Duration & Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Color(0xFF1A3E6C),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${widget.duration} ${widget.duration > 1 ? 'days' : 'day'}',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1A3E6C),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${widget.price.toStringAsFixed(0)}',
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
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

                  const SizedBox(height: 16),

                  // Benefits
                  Text(
                    'Benefits Included:',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A3E6C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...widget.benefits.map(
                    (benefit) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFF1A3E6C),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              benefit,
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Purchase form
                  Text(
                    'Purchase Information',
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

                        // Start date
                        GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                            );
                            if (picked != null && picked != _selectedDate) {
                              setState(() {
                                _selectedDate = picked;
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Start Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                const Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Quantity
                        Row(
                          children: [
                            Text(
                              'Quantity:',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {
                                if (_quantity > 1) {
                                  setState(() {
                                    _quantity--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove_circle_outline),
                              color: const Color(0xFF1A3E6C),
                            ),
                            Text(
                              _quantity.toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _quantity++;
                                });
                              },
                              icon: const Icon(Icons.add_circle_outline),
                              color: const Color(0xFF1A3E6C),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Total
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                '\$${(widget.price * _quantity).toStringAsFixed(0)}',
                                style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1A3E6C),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Submit button
                        BookButton(
                          text: 'COMPLETE PURCHASE',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Show success dialog
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text(
                                        'Purchase Successful',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF1A3E6C),
                                        ),
                                      ),
                                      content: Text(
                                        'Thank you for your purchase! A confirmation email has been sent to ${_emailController.text}.',
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
