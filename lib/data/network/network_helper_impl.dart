
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:digital_wallet/export.dart';

class NetworkHelperImpl extends NetworkHelper {
  NetworkHelperImpl();

  @override
  Future<Either<String, Failure>> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: appendHeader(headers: headers),

      );
      return handleResponse(response: response);
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> post(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
    bool modifyHeader = true,
    bool encodeBody = true,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: encodeBody ? json.encode(body) : body,
        headers: modifyHeader ? appendHeader(headers: headers) : headers,
        encoding: encoding,
      );

      return handleResponse(
        response: response,
        requestBody: json.encode(body),
      );
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> multipart(
    String url, {
    Map<String, String>? headers,
    body,
    files,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );

      body.forEach((key, value) => request.fields[key] = value);

      headers!.forEach((key, value) => request.headers[key] = value);
      // Handle files if present
      if (files != null) {
        for (final entry in files.entries) {
          final name = entry.key;
          final file = entry.value;

          if (file is XFile) {
            final bytes = await file.readAsBytes(); // Read the bytes from the XFile
            request.files.add(
              http.MultipartFile.fromBytes(
                name,
                bytes, // Use the bytes
                filename: file.name, // Set the filename
                contentType: MediaType('image', 'jpg'), // Set the appropriate media type
              ),
            );
          } else if (file is String) {
            request.files.add(
              await http.MultipartFile.fromPath(
                name,
                file,
              ),
            );
          } else {
            return Right(
              Failure(
                status: false,
                message: 'Unsupported file type',
              ),
            );
          }
        }
      }

      // files.forEach(
      //   (name, filePath) async => request.files.add(
      //     await http.MultipartFile.fromPath(
      //       name,
      //       filePath,
      //     ),
      //   ),
      // );

      http.StreamedResponse response = await request.send();

      String responseText = await response.stream.bytesToString();

      final int statusCode = response.statusCode;

      if (statusCode >= 400) {
        //Map<String, String> errorJson = jsonDecode(responseText);

        return Right(
          Failure(
            status: false,
            message: 'Something went wrong',
          ),
        );
      } else {
        return Left(responseText);
      }
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> delete(
    String url, {
    Map<String, String>? headers,
  }) async {
    return http
        .delete(Uri.parse(url), headers: appendHeader(headers: headers))
        .then((http.Response response) {
      return handleResponse(response: response);
    });
  }

  @override
  Future<Either<String, Failure>> put(
    String url, {
    Map<String, String>? headers,
    body,
    encoding,
  }) async {
    return http
        .put(Uri.parse(url),
            body: json.encode(body),
            headers: appendHeader(headers: headers),
            encoding: encoding)
        .then(
      (http.Response response) {
        return handleResponse(response: response);
      },
    );
  }

  @override
  Either<String, Failure> handleResponse({
    http.Response? response,
    String? requestBody,
  }) {
    final int statusCode = response!.statusCode;

    if (statusCode >= 400) {
      Map<String, dynamic> errorJson = jsonDecode(response.body.toString());
      final responseMessage = errorJson['error'] ?? 'Something went Wrong';
      return Right(
        Failure(
          status: false,
          message: responseMessage,
        ),
      );
    } else {
      return Left(response.body.toString());
    }
  }

  @override
  Map<String, String> appendHeader({
    Map<String, String>? headers,
    bool refresh = false,
  }) {
    try {
      headers ??= <String, String>{};
      headers["Authorization"] =
          'Bearer ${storage.getString(key: StorageKeys.accessToken)}';
      headers["Content-Type"] = "application/json";
    } catch (e) {
      debugPrint(e.toString());
    }

    return headers!;
  }
}
