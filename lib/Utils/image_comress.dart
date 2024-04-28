import 'dart:io';
import 'dart:typed_data';


Future<File?> compressImage(File inputFile) async {
  // Read the original image file
  // File inputFile = File(inputPath);
  Uint8List bytes = await inputFile.readAsBytes();

  // Set compression quality (adjust as needed)
  int quality = 80;

  // Compress the image by encoding it in JPEG format
  return await compressJpeg(bytes, quality);
}

Future<File> compressJpeg(Uint8List inputBytes, int quality) async {
  // Write the input bytes to a temporary file
  File tempFile = await File('1000028249.jpg').writeAsBytes(inputBytes);

  // Use the Dart Process class to call an external command (jpegoptim)
  ProcessResult result = await Process.run(
    'jpegoptim',
    ['-q', '--max=${quality.toString()}', '--strip-all', '-o', 'temp_image.jpg'],
    workingDirectory: tempFile.parent.path,
  );

  // Return the temporary compressed file
  return File('temp_image.jpg');
}
