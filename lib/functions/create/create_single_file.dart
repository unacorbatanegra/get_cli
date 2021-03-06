import 'dart:io';

import 'package:get_cli/core/structure.dart';
import 'package:get_cli/samples/interface/sample_interface.dart';
import 'package:recase/recase.dart';
import '../../core/structure.dart';

Future handleFileCreate(String name, String command, String on,
    bool extraFolder, Sample content) async {
  final fileModel = Structure.model(name, command, extraFolder, on: on);

  var reCase = ReCase(fileModel.name);
  var _file = await File(fileModel.path + '_${fileModel.commandName}.dart')
      .create(recursive: true);
  await _file.writeAsString(content.file(reCase.pascalCase));

  print(
      'file created succesfully with name :${fileModel.name} at path: ${fileModel.path}');
}
