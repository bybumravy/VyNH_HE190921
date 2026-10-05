import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveMovieApp());
}

// ─────────────────────────────────────────────
// MODEL
// ─────────────────────────────────────────────
class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;

  const Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}

// ─────────────────────────────────────────────
// SAMPLE DATA
// ─────────────────────────────────────────────
const List<Movie> allMovies = [
  Movie(
    title: 'Inception',
    year: 2010,
    genres: ['Action', 'Sci-Fi'],
    posterUrl: 'https://picsum.photos/seed/inception/200/300',
    rating: 8.8,
  ),
  Movie(
    title: 'The Dark Knight',
    year: 2008,
    genres: ['Action', 'Drama'],
    posterUrl: 'https://picsum.photos/seed/darkknight/200/300',
    rating: 9.0,
  ),
  Movie(
    title: 'Interstellar',
    year: 2014,
    genres: ['Sci-Fi', 'Drama'],
    posterUrl: 'https://picsum.photos/seed/interstellar/200/300',
    rating: 8.6,
  ),
  Movie(
    title: 'The Mask',
    year: 1994,
    genres: ['Comedy', 'Action'],
    posterUrl: 'https://picsum.photos/seed/themask/200/300',
    rating: 6.9,
  ),
  Movie(
    title: 'Titanic',
    year: 1997,
    genres: ['Drama', 'Romance'],
    posterUrl: 'https://picsum.photos/seed/titanic/200/300',
    rating: 7.9,
  ),
  Movie(
    title: 'The Hangover',
    year: 2009,
    genres: ['Comedy'],
    posterUrl: 'https://picsum.photos/seed/hangover/200/300',
    rating: 7.7,
  ),
];

// ─────────────────────────────────────────────
// APP ROOT
// ─────────────────────────────────────────────
class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Browser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GenreScreen(),
    );
  }
}

// ─────────────────────────────────────────────
// MAIN SCREEN
// ─────────────────────────────────────────────
class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
    'Sci-Fi',
    'Romance',
  ];

  // Currently selected genres
  final Set<String> selectedGenres = {};

  // Current search query
  String searchQuery = '';


  String selectedSort = 'A-Z';
  final List<String> sortOptions = ['A-Z', 'Z-A', 'Year', 'Rating'];

  // ── Filter & sort logic ──────────────────────
  List<Movie> get visibleMovies {
    // 1. Filter by search query
    List<Movie> result = allMovies.where((movie) {
      return movie.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    // 2. Filter by selected genres (if any genre is selected)
    if (selectedGenres.isNotEmpty) {
      result = result.where((movie) {
        // Movie must have at least one of the selected genres
        return movie.genres.any((g) => selectedGenres.contains(g));
      }).toList();
    }

    // 3. Sort
    switch (selectedSort) {
      case 'A-Z':
        result.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Z-A':
        result.sort((a, b) => b.title.compareTo(a.title));
        break;
      case 'Year':
        result.sort((a, b) => a.year.compareTo(b.year));
        break;
      case 'Rating':
        result.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find a Movie',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Discover your next favourite movie',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              _buildSearchBar(),
              const SizedBox(height: 12),
              _buildGenreChips(),
              const SizedBox(height: 8),
              _buildSortBar(),
              const SizedBox(height: 8),
              Expanded(
                child: _buildMovieList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Search Bar ───────────────────────────────
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search movies...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
      onChanged: (value) {
        setState(() {
          searchQuery = value;
        });
      },
    );
  }

  // ── Genre Chips (Wrap for responsiveness) ────
  Widget _buildGenreChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Genres',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            if (selectedGenres.isNotEmpty) ...[
              const SizedBox(width: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${selectedGenres.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: genres.map((genre) {
            final isSelected = selectedGenres.contains(genre);
            return FilterChip(
              label: Text(genre),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedGenres.add(genre);
                  } else {
                    selectedGenres.remove(genre);
                  }
                });
              },
              selectedColor:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
              checkmarkColor: Theme.of(context).colorScheme.primary,
            );
          }).toList(),
        ),
      ],
    );
  }

  // ── Sort Dropdown ────────────────────────────
  Widget _buildSortBar() {
    return Row(
      children: [
        const Text(
          'Sort by:',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 8),
        DropdownButton<String>(
          value: selectedSort,
          items: sortOptions
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedSort = value;
              });
            }
          },
        ),
        const Spacer(),
        Text(
          '${visibleMovies.length} movies',
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }

  // ── Responsive Movie List ────────────────────
  Widget _buildMovieList() {
    final movies = visibleMovies;

    if (movies.isEmpty) {
      return const Center(
        child: Text('No movies found.', style: TextStyle(color: Colors.grey)),
      );
    }

    // Use LayoutBuilder to decide layout based on available width
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildMovieCard(movies[index]),
              );
            },
          );
        } else {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3.0,
            children: movies.map((movie) => _buildMovieCard(movie)).toList(),
          );
        }
      },
    );
  }

  // ── Movie Card ───────────────────────────────
  Widget _buildMovieCard(Movie movie) {
    // Use LayoutBuilder inside movie card to adjust poster size based on item width
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust poster dimensions dynamically based on available card width
        final double posterWidth = constraints.maxWidth > 350 ? 90 : 75;
        final double posterHeight = constraints.maxWidth > 350 ? 120 : 100;

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // Poster image
              ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(12)),
                child: Image.network(
                  movie.posterUrl,
                  width: posterWidth,
                  height: posterHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    width: posterWidth,
                    height: posterHeight,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.movie, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Movie info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${movie.year}',
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      // Rating
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            movie.rating.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Genre tags
                      Wrap(
                        spacing: 4,
                        children: movie.genres
                            .map((g) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    g,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.deepPurple),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


