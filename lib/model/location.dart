class Location {
  final String title;
  bool visited;

  Location({
    required this.title,
    required this.visited,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'visited': visited,
    };
  }

  factory Location.fromFirestore(Map<String, dynamic> data) {
    return Location(
      title: data['title'] ?? '',
      visited: data['visited'] ?? false,
    );
  }
}
