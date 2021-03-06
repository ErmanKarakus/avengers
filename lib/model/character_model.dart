class CharacterDataWrapper {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  CharacterDataContainer data;
  String etag;

  CharacterDataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.data,
    required this.etag,
  });

  factory CharacterDataWrapper.fromJson(Map<String, dynamic> json) => CharacterDataWrapper(
    code: json["code"],
    status: json["status"],
    copyright: json["copyright"],
    attributionText: json["attributionText"],
    attributionHtml: json["attributionHTML"],
    data: CharacterDataContainer.fromJson(json["data"]),
    etag: json["etag"],
  );
}

class CharacterDataContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<CharacterModel> results;

  CharacterDataContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory CharacterDataContainer.fromJson(Map<String, dynamic> json) => CharacterDataContainer(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results: List<CharacterModel>.from(json["results"].map((x) => CharacterModel.fromJson(x))),
  );
}

class CharacterModel {
  int id;
  String name;
  String description;
  DateTime modified;
  String resourceUri;
  List<UrlModel> urls;
  ImageModel thumbnail;
  ComicListModel comics;

  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceUri,
    required this.urls,
    required this.thumbnail,
    required this.comics,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    modified: DateTime.parse(json["modified"]),
    resourceUri: json["resourceURI"],
    urls: List<UrlModel>.from(json["urls"].map((x) => UrlModel.fromJson(x))),
    thumbnail: ImageModel.fromJson(json["thumbnail"]),
    comics: ComicListModel.fromJson(json["comics"]),
  );
}

class ComicListModel {
  int available;
  int returned;
  String collectionUri;
  List<ComicSummaryModel> items;

  ComicListModel({required this.available, required this.returned, required this.collectionUri, required this.items});

  factory ComicListModel.fromJson(Map<String, dynamic> json) => ComicListModel(
    available: json["available"],
    returned: json["returned"],
    collectionUri: json["collectionURI"],
    items: List<ComicSummaryModel>.from(json["items"].map((x) => ComicSummaryModel.fromJson(x))),
  );
}

class ComicSummaryModel {
  String resourceUri;
  String name;

  ComicSummaryModel({required this.resourceUri, required this.name,});

  factory ComicSummaryModel.fromJson(Map<String, dynamic> json) => ComicSummaryModel(
    resourceUri: json["resourceURI"],
    name: json["name"],
  );
}

class ImageModel {
  String path;
  String extension;

  ImageModel({required this.path, required this.extension,});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    path: json["path"],
    extension: json["extension"],
  );
}

class UrlModel {
  String type;
  String url;

  UrlModel({required this.type, required this.url,});

  factory UrlModel.fromJson(Map<String, dynamic> json) => UrlModel(
    type: json["type"],
    url: json["url"],
  );
}