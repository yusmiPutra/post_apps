class User {
  User({
    this.idUser,
    this.idPaketSubscription,
    this.userIcNumber,
    this.userCode,
    this.companyId,
    this.userName,
    this.userTelp,
    this.userEmail,
    this.userAddress,
    this.userPhoto,
    this.cashInHand,
    this.userStatus,
    this.paidAt,
    this.userExpired,
    this.paymentStatus,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.emailVerifiedAt,
    this.apiToken,
  });

  int? idUser;
  int? idPaketSubscription;
  String? userIcNumber;
  String? userCode;
  int? companyId;
  String? userName;
  String? userTelp;
  String? userEmail;
  String? userAddress;
  String? userPhoto;
  String? cashInHand;
  String? userStatus;
  String? paidAt;
  String? userExpired;
  String? paymentStatus;
  String? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic emailVerifiedAt;
  dynamic apiToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json["id_user"] == null ? null : json["id_user"],
    idPaketSubscription: json["id_paket_subscription"] == null ? null : json["id_paket_subscription"],
    userIcNumber: json["user_ic_number"] == null ? null : json["user_ic_number"],
    userCode: json["user_code"] == null ? null : json["user_code"],
    companyId: json["company_id"] == null ? null : json["company_id"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userTelp: json["user_telp"] == null ? null : json["user_telp"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userAddress: json["user_address"] == null ? null : json["user_address"],
    userPhoto: json["user_photo"] == null ? null : json["user_photo"],
    cashInHand: json["cash_in_hand"] == null ? null : json["cash_in_hand"],
    userStatus: json["user_status"] == null ? null : json["user_status"],
    paidAt: json["paid_at"] == null ? null : json["paid_at"],
    userExpired: json["user_expired"] == null ? null : json["user_expired"],
    paymentStatus: json["payment_status"] == null ? null : json["payment_status"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    emailVerifiedAt: json["email_verified_at"],
    apiToken: json["api_token"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser == null ? null : idUser,
    "id_paket_subscription": idPaketSubscription == null ? null : idPaketSubscription,
    "user_ic_number": userIcNumber == null ? null : userIcNumber,
    "user_code": userCode == null ? null : userCode,
    "company_id": companyId == null ? null : companyId,
    "user_name": userName == null ? null : userName,
    "user_telp": userTelp == null ? null : userTelp,
    "user_email": userEmail == null ? null : userEmail,
    "user_address": userAddress == null ? null : userAddress,
    "user_photo": userPhoto == null ? null : userPhoto,
    "cash_in_hand": cashInHand == null ? null : cashInHand,
    "user_status": userStatus == null ? null : userStatus,
    "paid_at": paidAt == null ? null : paidAt,
    "user_expired": userExpired == null ? null : userExpired,
    "payment_status": paymentStatus == null ? null : paymentStatus,
    "is_active": isActive == null ? null : isActive,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
    "email_verified_at": emailVerifiedAt,
    "api_token": apiToken,
  };
}