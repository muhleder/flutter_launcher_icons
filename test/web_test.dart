import 'dart:io';

import 'package:flutter_launcher_icons/web.dart';
import 'package:image/image.dart';
import 'package:test/test.dart';

const String wideImagePath   = 'images/wide.png';
const String tallImagePath   = 'images/tall.png';
const String squareImagePath = 'images/square.png';

void main() {
  
  test('Has favicon support.', () {
    bool hasFavicon = false;

    for (WebIconTemplate template in webIcons) {
      hasFavicon = template.name == 'favicon.png';
    }

    expect(hasFavicon, true);
  });

  test('Correctly crops wide input images', () {
    testImageCrop(wideImagePath, 192);
  });

  test('Correctly crops tall input images', () {
    testImageCrop(tallImagePath, 192);
  });

  test('Correctly crops square input images.', () {
    testImageCrop(squareImagePath, 192);
  });
}

void testImageCrop(String imagePath, int expectedSize) {
    final WebIconTemplate testTemplate = WebIconTemplate(name: 'Icon-$expectedSize.png', size: expectedSize);
    final Image testImage = decodeImage(File(imagePath).readAsBytesSync());

    final Image resizedImage = testTemplate.createFrom(testImage);

    expect(resizedImage.width == resizedImage.height, true);
    expect(resizedImage.width, expectedSize);
}
