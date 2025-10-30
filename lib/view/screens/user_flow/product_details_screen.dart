import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routes/route_path.dart';
import '../../widgets/button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentImageIndex = 0;
  bool showAddedToCart = false;
  late PageController _pageController;

  // Images for slider
  final List<String> productImages = [
    'assets/images/shoes.png',
    'assets/images/shoes_side.png',
    'assets/images/shoes_sole.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go(RoutePath.home),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () => context.go(RoutePath.viewCart),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Slider
                Stack(
                  children: [
                    Container(
                      height: 210,
                      width: double.infinity,
                      color: Colors.white,
                      child: PageView.builder(
                        itemCount: productImages.length,
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            productImages[index],
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/icons/amazon.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF5B9FD8), Color(0xFFE04848)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.star, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text(
                              'American Made',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Page Indicator
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(productImages.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentImageIndex == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentImageIndex == index ? Colors.blue : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 16),

                // Thumbnails
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(productImages.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: _buildThumbnail(productImages[index], index),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 20),

                // Product Info
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Men\'s Lightweight Running Shoes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        '\$199',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '\$199',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Brand: New Balance',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' (123 Reviews)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Step into comfort and performance with our Men\'s Lightweight Running Shoes. Whether you\'re hitting the gym, jogging on trails, or simply going about your daily routine, these sneakers are built to support your active lifestyle',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Material Chips
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Material',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildMaterialChip('Ethylene Vinyl Acetate'),
                      const SizedBox(width: 8),
                      _buildMaterialChip('Water Resistant'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/american_flag_banner.png',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Related Products
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'More American Made Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildRelatedProduct('Leather Belt', '\$44', 'assets/images/belt.png'),
                      _buildRelatedProduct('Winter Hoodie', '\$39', 'assets/images/hoodie.png'),
                    ],
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),

          if (showAddedToCart)
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Added to Cart',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/shoes.png',
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Men\'s Lightweight Running Shoes',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Text(
                                    '\$199',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    '\$199',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'By Amazon',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF5B9FD8), Color(0xFFE04848)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.star, color: Colors.white, size: 12),
                              SizedBox(width: 4),
                              Text(
                                'American Made',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Continue',
                            onPressed: () {
                              setState(() => showAddedToCart = false);
                            },
                            isOutlined: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomButton(
                            text: 'View Cart',
                            onPressed: () => context.go(RoutePath.viewCart),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(26),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Add to cart',
                onPressed: () {
                  setState(() => showAddedToCart = true);
                },
                isOutlined: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                text: 'Buy Now',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentImageIndex = index;
        });
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: currentImageIndex == index ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF565656),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildRelatedProduct(String title, String price, String image) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Image.asset(image, fit: BoxFit.contain),
          ),

          // Text + Icon Section
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Icon Row
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/icons/amazon.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}