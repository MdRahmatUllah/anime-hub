import 'package:flutter/material.dart';

class ImageData {
  // all should be jpg image
  final String image_url;
  final String small_image_url;
  final String large_image_url;
  ImageData(
      {this.image_url = '',
      this.small_image_url = '',
      this.large_image_url = ''});
}
