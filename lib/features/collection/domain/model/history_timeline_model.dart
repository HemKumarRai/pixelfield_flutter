class HistoryTimeLineModel {
  final String label;
  final String title;
  final String description;
  final List<String> attachments; // Use image paths or network URLs

  HistoryTimeLineModel({
    required this.label,
    required this.title,
    required this.description,
    required this.attachments,
  });
}
