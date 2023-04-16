import 'package:kakanda_tech/model/data/packages.dart';
import 'package:kakanda_tech/model/data/user.dart';

class Transaction {
  Transaction({
    required this.idTransaction,
    required this.userId,
    required this.idPackage,
    required this.phoneNumber,
    required this.paymentMethod,
    required this.paymentTotal,
    required this.paymentStatus,
    required this.paymentUrl,
    required this.projectDesc,
    required this.deadline,
    required this.workingStatus,
    required this.persentase,
    required this.processDesc,
    required this.createdAt,
    required this.updatedAt,
    required this.package,
    required this.user,
  });

  int idTransaction;
  String userId;
  String idPackage;
  String phoneNumber;
  String paymentMethod;
  String paymentTotal;
  String paymentStatus;
  String paymentUrl;
  dynamic projectDesc;
  DateTime deadline;
  String workingStatus;
  String persentase;
  dynamic processDesc;
  DateTime createdAt;
  DateTime updatedAt;
  Package package;
  User user;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        idTransaction: json["id_transaction"],
        userId: json["user_id"],
        idPackage: json["id_package"],
        phoneNumber: json["phone_number"],
        paymentMethod: json["payment_method"],
        paymentTotal: json["payment_total"],
        paymentStatus: json["payment_status"],
        paymentUrl: json["payment_url"],
        projectDesc: json["project_desc"] == null ? null : json["project_desc"],
        deadline: DateTime.parse(json["deadline"]),
        workingStatus: json["working_status"],
        persentase: json["persentase"],
        processDesc: json["process_desc"] == null ? null : json["process_desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        package: Package.fromJson(json["package"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id_transaction": idTransaction,
        "user_id": userId,
        "id_package": idPackage,
        "phone_number": phoneNumber,
        "payment_method": paymentMethod,
        "payment_total": paymentTotal,
        "payment_status": paymentStatus,
        "payment_url": paymentUrl,
        "project_desc": projectDesc == null ? null : projectDesc,
        "deadline":
            "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
        "working_status": workingStatus,
        "persentase": persentase,
        "process_desc": processDesc == null ? null : processDesc,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "package": package.toJson(),
        "user": user.toJson(),
      };
}
