import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:jti_adit_test/app/helpers/helper_date_picker.dart';

void main() {
  /// cupertino
  testWidgets('Cupertino date picker shows up', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: ElevatedButton(
            onPressed: () {
              DatePickerHelper.cupertino(callback: (DateTime dateTime) {});
            },
            child: Text('Show Cupertino Picker'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Cupertino Picker'));
    await tester.pumpAndSettle();

    expect(find.text('Select Date'), findsOneWidget);
    expect(find.text('Select'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });

  /// material
  testWidgets('Material date picker shows up', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: ElevatedButton(
            onPressed: () async {
              await DatePickerHelper.material(callback: (DateTime dateTime) {});
            },
            child: Text('Show Material Picker'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Material Picker'));
    await tester.pumpAndSettle();

    expect(find.text('OK'), findsOneWidget);
  });
}
