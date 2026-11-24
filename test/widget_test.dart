import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  test('Project serializes to and from JSON', () {
    const project = Project(
      id: '123e4567-e89b-12d3-a456-426614174000',
      title: 'MyPortfolio',
      description: 'Personal portfolio app',
      techStack: 'Flutter, Django',
      projectUrl: 'https://example.com',
    );

    final json = project.toJson();
    expect(json.containsKey('id'), isFalse);
    expect(json['tech_stack'], 'Flutter, Django');

    final decoded = Project.fromJson({
      'id': '123e4567-e89b-12d3-a456-426614174000',
      'title': 'MyPortfolio',
      'description': 'Personal portfolio app',
      'tech_stack': 'Flutter, Django',
      'project_url': 'https://example.com',
    });
    expect(decoded.projectImageUrl, '');
    expect(decoded.title, 'MyPortfolio');
  });

  testWidgets('LoginScreen renders username and password fields', (
    WidgetTester tester,
  ) async {
    final apiClient = ApiClient();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider.value(value: apiClient),
          ChangeNotifierProvider(create: (_) => AuthState(apiClient)),
        ],
        child: const MaterialApp(home: LoginScreen()),
      ),
    );

    expect(find.text('Username'), findsWidgets);
    expect(find.text('Password'), findsWidgets);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}
