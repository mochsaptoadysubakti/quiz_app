import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quiz_app/main.dart'; // Sesuaikan dengan nama aplikasi

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // Perbaikan binding

  testWidgets('Menampilkan halaman utama', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp()); // Pastikan MyApp ada di main.dart

    expect(find.text('Mulai Kuis'), findsOneWidget);
  });
}
