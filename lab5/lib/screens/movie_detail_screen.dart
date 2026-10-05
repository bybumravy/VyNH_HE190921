import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool _isFavorite = false;
  bool _isRated = false;

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          movie.title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero banner (Stack + Image + Gradient + Title)
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  movie.posterUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 220,
                    color: Colors.grey.shade800,
                    child: const Center(
                      child: Icon(Icons.movie, size: 60, color: Colors.white70),
                    ),
                  ),
                ),
                // Gradient overlay
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xD9000000),
                      ],
                      stops: const [0.4, 1.0],
                    ),
                  ),
                ),
                // Movie title on banner
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // 2. Genres displayed as chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: movie.genres.map((genre) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      genre,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // 3. Overview text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                movie.overview,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.grey.shade800,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 4. Action buttons (Favorite / Rate / Share)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.black87,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
                    const Text('Favorite', style: TextStyle(fontSize: 12)),
                  ],
                ),
                // Nút Rate (bấm vào để sáng/tắt ngôi sao vàng)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        _isRated ? Icons.star : Icons.star_border,
                        color: _isRated ? Colors.amber : Colors.black87,
                      ),
                      onPressed: () {
                        setState(() {
                          _isRated = !_isRated;
                        });
                      },
                    ),
                    const Text('Rate', style: TextStyle(fontSize: 12)),
                  ],
                ),
                // Nút Share
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.black87),
                      onPressed: () {},
                    ),
                    const Text('Share', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 5. Trailers Section Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Trailers',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // 6. Trailer list using ListView.builder
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: movie.trailers.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                indent: 16,
                endIndent: 16,
                color: Colors.grey.shade200,
              ),
              itemBuilder: (context, index) {
                final trailer = movie.trailers[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 0.0,
                  ),
                  leading: const Icon(
                    Icons.play_circle_fill,
                    size: 26,
                    color: Colors.black87,
                  ),
                  title: Text(
                    trailer.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Playing "${trailer.name}"'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

}
