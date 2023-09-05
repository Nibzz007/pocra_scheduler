import 'dart:convert';

AllFarmersModel allFarmersModelFromJson(String str) => AllFarmersModel.fromJson(json.decode(str));

String allFarmersModelToJson(AllFarmersModel data) => json.encode(data.toJson());

class AllFarmersModel {
    String message;
    List<Datum> data;
    int statusCode;

    AllFarmersModel({
        required this.message,
        required this.data,
        required this.statusCode,
    });

    factory AllFarmersModel.fromJson(Map<String, dynamic> json) => AllFarmersModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class Datum {
    int id;
    String name;
    String nameMr;
    String gatNumber;
    String phoneNumber;
    double totalArea;
    List<CropElement> crops;
    List<Pump> pumps;

    Datum({
        required this.id,
        required this.name,
        required this.nameMr,
        required this.gatNumber,
        required this.phoneNumber,
        required this.totalArea,
        required this.crops,
        required this.pumps,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        nameMr: json["name_mr"],
        gatNumber: json["gat_number"],
        phoneNumber: json["phone_number"],
        totalArea: json["total_area"]?.toDouble(),
        crops: List<CropElement>.from(json["crops"].map((x) => CropElement.fromJson(x))),
        pumps: List<Pump>.from(json["pumps"].map((x) => Pump.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_mr": nameMr,
        "gat_number": gatNumber,
        "phone_number": phoneNumber,
        "total_area": totalArea,
        "crops": List<dynamic>.from(crops.map((x) => x.toJson())),
        "pumps": List<dynamic>.from(pumps.map((x) => x.toJson())),
    };
}

class CropElement {
    IrrigationMethodClass crop;
    IrrigationMethodClass irrigationMethod;
    IrrigationMethodClass soilType;
    double area;

    CropElement({
        required this.crop,
        required this.irrigationMethod,
        required this.soilType,
        required this.area,
    });

    factory CropElement.fromJson(Map<String, dynamic> json) => CropElement(
        crop: IrrigationMethodClass.fromJson(json["crop"]),
        irrigationMethod: IrrigationMethodClass.fromJson(json["irrigation_method"]),
        soilType: IrrigationMethodClass.fromJson(json["soil_type"]),
        area: json["area"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "crop": crop.toJson(),
        "irrigation_method": irrigationMethod.toJson(),
        "soil_type": soilType.toJson(),
        "area": area,
    };
}

class IrrigationMethodClass {
    int id;
    DateTime createdAt;
    DateTime updatedAt;
    Name name;
    NameMr nameMr;
    String? waterRequirement;

    IrrigationMethodClass({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
        required this.nameMr,
        this.waterRequirement,
    });

    factory IrrigationMethodClass.fromJson(Map<String, dynamic> json) => IrrigationMethodClass(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: nameValues.map[json["name"]]!,
        nameMr: nameMrValues.map[json["name_mr"]]!,
        waterRequirement: json["water_requirement"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": nameValues.reverse[name],
        "name_mr": nameMrValues.reverse[nameMr],
        "water_requirement": waterRequirement,
    };
}

enum Name {
    BORDER_IRRIGATION,
    B_JOWAR,
    COTTON,
    DRIP_IRRIGATION,
    FODDER,
    FURROW_IRRIGATION,
    HARBARA,
    POOR,
    SOYBEAN,
    TURMERIC,
    VEGETABLE,
    WHEAT
}

final nameValues = EnumValues({
    "Border irrigation": Name.BORDER_IRRIGATION,
    "B. Jowar": Name.B_JOWAR,
    "Cotton": Name.COTTON,
    "Drip irrigation": Name.DRIP_IRRIGATION,
    "Fodder": Name.FODDER,
    "Furrow irrigation": Name.FURROW_IRRIGATION,
    "Harbara": Name.HARBARA,
    "Poor": Name.POOR,
    "Soybean": Name.SOYBEAN,
    "Turmeric": Name.TURMERIC,
    "Vegetable": Name.VEGETABLE,
    "Wheat": Name.WHEAT
});

enum NameMr {
    AMBITIOUS,
    CUNNING,
    EMPTY,
    FLUFFY,
    HILARIOUS,
    INDECENT,
    INDIGO,
    MAGENTA,
    NAME_MR,
    PURPLE,
    STICKY,
    TENTACLED
}

final nameMrValues = EnumValues({
    "सीमा सिंचन": NameMr.AMBITIOUS,
    "ठिबक सिंचन": NameMr.CUNNING,
    "सोयाबीन": NameMr.EMPTY,
    "भाजी": NameMr.FLUFFY,
    "फ्यूरो सिंचन": NameMr.HILARIOUS,
    "चारा": NameMr.INDECENT,
    "हळद": NameMr.INDIGO,
    "निम्न": NameMr.MAGENTA,
    "गहू": NameMr.NAME_MR,
    "बी. ज्वार": NameMr.PURPLE,
    "हरबारा": NameMr.STICKY,
    "कापूस": NameMr.TENTACLED
});

class Pump {
    String? name;
    double capacity;
    SourceType sourceType;
    bool directToField;
    int dtId;

    Pump({
        required this.name,
        required this.capacity,
        required this.sourceType,
        required this.directToField,
        required this.dtId,
    });

    factory Pump.fromJson(Map<String, dynamic> json) => Pump(
        name: json["name"],
        capacity: json["capacity"]?.toDouble(),
        sourceType: sourceTypeValues.map[json["source_type"]]!,
        directToField: json["direct_to_field"],
        dtId: json["dt_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "capacity": capacity,
        "source_type": sourceTypeValues.reverse[sourceType],
        "direct_to_field": directToField,
        "dt_id": dtId,
    };
}

enum SourceType {
    BORE_WELL,
    OPEN_WELL,
    SURFACE_WATER
}

final sourceTypeValues = EnumValues({
    "bore_well": SourceType.BORE_WELL,
    "open_well": SourceType.OPEN_WELL,
    "surface_water": SourceType.SURFACE_WATER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
