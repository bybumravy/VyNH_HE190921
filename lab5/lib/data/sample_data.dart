import '../models/movie.dart';

final List<Movie> sampleMovies = [
  const Movie(
    id: '1',
    title: 'Dune: Part Two',
    posterUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=800',
    overview:
        'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: [
      Trailer(id: 't1', name: 'Official Trailer #1'),
      Trailer(id: 't2', name: 'IMAX Sneak Peek'),
    ],
  ),
  const Movie(
    id: '2',
    title: 'Deadpool & Wolverine',
    posterUrl: 'https://images.unsplash.com/photo-1509114397022-ed747cca3f65?w=800',
    overview:
        'The multiverse gets messy when Wade Wilson teams up with Wolverine for a not-so-family-friendly mission.',
    genres: ['Action', 'Comedy'],
    rating: 8.3,
    trailers: [
      Trailer(id: 't3', name: 'Red Band Trailer'),
      Trailer(id: 't4', name: 'Behind the Scenes'),
    ],
  ),
  const Movie(
    id: '3',
    title: 'Inside Out 2',
    posterUrl: 'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?w=800',
    overview:
        'Teenager Riley\'s mind undergoes a sudden demolition to make room for unexpected new Emotions.',
    genres: ['Animation', 'Adventure', 'Comedy'],
    rating: 7.9,
    trailers: [
      Trailer(id: 't5', name: 'Teaser Trailer'),
      Trailer(id: 't6', name: 'Official Trailer'),
    ],
  ),
];
