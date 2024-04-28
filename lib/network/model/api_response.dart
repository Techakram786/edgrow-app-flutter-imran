class ApiResponse {
  String? status;
  String? message;
  dynamic data; // Allow data to be of any type

  ApiResponse({
    this.status,
    this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}