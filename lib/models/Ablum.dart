class Album {
  final String title;
  final int albumId;
  final String thumnailUrl;
  final String url;
  final int id;

  Album({this.title, this.albumId, this.thumnailUrl, this.url, this.id});

  factory Album.fromJsonToInstance(Map<String, dynamic> data) {
    print(data['thumbnailUrl'].length);
    return Album(
      id: data['id'],
      albumId: data['albumId'],
      thumnailUrl: data['thumbnailUrl'],
      title: data['title'],
      url: data['url'],
    );
  }
}