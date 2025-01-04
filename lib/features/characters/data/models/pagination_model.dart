class PaginationInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  PaginationInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  /// Factory method to parse JSON
  factory PaginationInfo.fromJson(Map<String, dynamic> json) {
    return PaginationInfo(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}