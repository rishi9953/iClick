import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:technical_round/Networks/urls.dart'; // Ensure baseUrl is defined here

class Networks {
  final Dio _dio;

  Networks({
    Map<String, dynamic>? defaultHeaders,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl, // Set baseUrl in BaseOptions
            headers: defaultHeaders ?? {'Content-Type': 'application/json'},
            connectTimeout: const Duration(milliseconds: 5000),
            receiveTimeout: const Duration(milliseconds: 3000),
          ),
        ) {
    // Add any interceptors if needed
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Log requests or add additional headers if needed
          debugPrint("Request: ${options.method} ${options.uri}");
          debugPrint("Request data: ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Log responses or manipulate them if needed
          debugPrint("Response: ${response.statusCode} ${response.data}");
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          // Handle errors globally
          debugPrint("Error: ${error.response?.statusCode} ${error.message}");
          return handler.next(error);
        },
      ),
    );
  }

  // GET request
  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST request
  Future<dynamic> post(String endpoint, dynamic data) async {
    debugPrint('POST Request: $endpoint with data: $data');
    try {
      final response = await _dio.post(
        endpoint, // Use endpoint directly since baseUrl is in BaseOptions
        data: data,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT request
  Future<dynamic> put(String endpoint, dynamic data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE request
  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Error handling
  Exception _handleError(DioException error) {
    String errorDescription = '';
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      errorDescription = "Connection timeout with the server.";
    } else if (error.type == DioExceptionType.badResponse) {
      errorDescription =
          "Received invalid status code: ${error.response?.statusCode}. Details: ${error.response?.data}";
    } else if (error.type == DioExceptionType.unknown) {
      errorDescription = "Unexpected error occurred: ${error.message}";
    }
    return Exception(errorDescription);
  }
}
