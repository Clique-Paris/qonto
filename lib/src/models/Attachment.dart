class Attachment {
  final DateTime createdAt;
  final String fileName;
  final int fileSize;
  // TODO: Change with MIME type
  final String fileContentType;
  final String url;

  Attachment(
      {this.createdAt,
      this.fileName,
      this.fileSize,
      this.fileContentType,
      this.url}) {
    ArgumentError.checkNotNull(createdAt, 'createdAt');
    ArgumentError.checkNotNull(fileName, 'fileName');
    ArgumentError.checkNotNull(fileSize, 'fileSize');
    ArgumentError.checkNotNull(fileContentType, 'fileContentType');
    ArgumentError.checkNotNull(url, 'url');
  }

  /// Function constructs an Attachment object from the API's return type
  ///
  /// @param json The JSON object that we got from API
  /// @returns Attachment object that we constructed from API return
  /// @throws Throws an ArgumentError which caused by a missing parameter on Attachment constructor
  static Attachment fromJSON(Map<String, dynamic> json) {
    return Attachment(
        createdAt: DateTime.parse(json['created_at']),
        fileName: json['file_name'],
        fileSize: int.parse(json['file_size']),
        fileContentType: json['file_content_type'],
        url: json['url']);
  }

  /// Function returns the String representation of an Attachment object
  ///
  /// @returns The String representation of an Attachment object
  @override
  String toString() {
    var result = '';
    result += 'Created at: ${createdAt.toIso8601String()}\n';
    result += 'File name: ${fileName}\n';
    result += 'File size: ${fileSize}\n';
    result += 'File content type: ${fileContentType}\n';
    result += 'File url: ${url}';
    return result;
  }
}
