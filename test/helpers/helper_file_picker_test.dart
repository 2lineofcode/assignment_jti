import 'package:flutter_test/flutter_test.dart';
import 'package:jti_adit_test/app/helpers/helper_file_picker.dart';

void main() {
  test('Image picker returns base64 string', () async {
    /// Mocking a function that returns a cropped file
    /// TODO: ....

    /// Mocking the ImagePicker.pickImage method
    /// TODO: ....

    /// Testing the image picker
    await PickerHelper.image(callback: (String base64Img) {
      // Asserting that the callback is called with a non-empty base64 string
      expect(base64Img.isNotEmpty, true);
    });
  });
}
