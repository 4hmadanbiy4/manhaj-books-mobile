// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

List<Reservation> reservationFromJson(String str) => List<Reservation>.from(json.decode(str).map((x) => Reservation.fromJson(x)));

String reservationToJson(List<Reservation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reservation {
    String model;
    String pk;
    Fields fields;

    Reservation({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String pemesan;
    String buku;
    int pcs;

    Fields({
        required this.user,
        required this.pemesan,
        required this.buku,
        required this.pcs,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        pemesan: json["pemesan"],
        buku: json["buku"],
        pcs: json["pcs"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "pemesan": pemesan,
        "buku": buku,
        "pcs": pcs,
    };
}
