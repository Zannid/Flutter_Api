class DataPosts {
  final List<PostModel> data;

  DataPosts({required this.data});

  factory DataPosts.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<PostModel> posts = list.map((i) => PostModel.fromJson(i)).toList();
    return DataPosts(data: posts);
  }
}

class PostModel {
  final int? id;
  final String? title;
  final String? content;
  final String? foto;
  final int? status;
  final String? createdAt;

  PostModel({
    this.id,
    this.title,
    this.content,
    this.foto,
    this.status,
    this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      foto: json['foto'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }
}
