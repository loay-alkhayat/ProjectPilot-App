import 'dart:io';

import 'package:dio/dio.dart';

class UploadProposalParameters {
  final String pdfDescription;
  final String pdfName;
  final File file;

  UploadProposalParameters({
    required this.pdfDescription,
    required this.pdfName,
    required this.file,
  });

  Map<String, dynamic> toJson() => {
        'name': pdfName,
        'description': pdfDescription,
        'file': MultipartFile.fromFileSync(file.path,
            filename: file.path.split('/').last),
      };
}
