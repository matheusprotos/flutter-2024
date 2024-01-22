import 'package:flutter_2024/app_modular.dart';
import 'package:flutter_2024/main.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Load todos',
    (tester) async {
      await tester.pumpWidget(
        ModularApp(
          module: AppModule(),
          child: const MyApp(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Fazer as compras'), findsOneWidget);
      expect(find.text('Limpar a casa'), findsOneWidget);
      expect(find.text('Jantar'), findsOneWidget);
    },
  );
}
