import 'package:copy_with_extension/copy_with_extension.dart';

part 'Test.g.dart';

@CopyWith(generateCopyWithNull: true)
class Test
{
  @CopyWithField(immutable: true)
  final int id;
  final String? name;

  Test({required this.id, required this.name});
}