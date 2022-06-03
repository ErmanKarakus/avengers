import 'package:avengers/model/character_model.dart';

class ComicDataWrapper {
  String code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  ComicDataContainer data;
  String etag;

  ComicDataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.data,
    required this.etag,
  });

  factory ComicDataWrapper.fromJson(Map<String, dynamic> json) => ComicDataWrapper(
    code: json["code"],
    status: json["status"],
    copyright: json["copyright"],
    attributionText: json["attributionText"],
    attributionHtml: json["attributionHTML"],
    data: ComicDataContainer.fromJson(json["data"]),
    etag: json["etag"],
  );

}

class ComicDataContainer {
  String offset;
  String limit;
  String total;
  String count;
  List<ComicModel> results;

  ComicDataContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory ComicDataContainer.fromJson(Map<String, dynamic> json) => ComicDataContainer(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results: List<ComicModel>.from(json["results"].map((x) => ComicModel.fromJson(x))),
  );

}

class ComicModel {
  String id;
  String digitalId;
  String title;
  String issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  String pageCount;
  String resourceUri;
  List<DateModel> dates;
  ImageModel thumbnail;

  ComicModel({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.resourceUri,
    required this.dates,
    required this.thumbnail,
  });

  factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
    id: json["id"],
    digitalId: json["digitalId"],
    title: json["title"],
    issueNumber: json["issueNumber"],
    variantDescription: json["variantDescription"],
    description: json["description"],
    modified: json["modified"],
    isbn: json["isbn"],
    upc: json["upc"],
    diamondCode: json["diamondCode"],
    ean: json["ean"],
    issn: json["issn"],
    format: json["format"],
    pageCount: json["pageCount"],
    resourceUri: json["resourceURI"],
    dates: List<DateModel>.from(json["dates"].map((x) => DateModel.fromJson(x))),
    thumbnail: ImageModel.fromJson(json["thumbnail"]),
  );

}

class DateModel {
  String type;
  String date;

  DateModel({required this.type, required this.date});

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
    type: json["type"],
    date: json["date"],
  );

}