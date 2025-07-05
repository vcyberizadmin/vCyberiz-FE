// To parse this JSON data, do
//
//     final uploadPdfModel = uploadPdfModelFromJson(jsonString);

import 'dart:convert';

List<UploadPdfModel> uploadPdfModelFromJson(String str) =>
    List<UploadPdfModel>.from(
        json.decode(str).map((x) => UploadPdfModel.fromJson(x)));

String uploadPdfModelToJson(List<UploadPdfModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UploadPdfModel {
  final int? id;
  final String? documentId;
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final dynamic width;
  final dynamic height;
  final dynamic formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  UploadPdfModel({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory UploadPdfModel.fromJson(Map<String, dynamic> json) => UploadPdfModel(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: json["formats"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}
