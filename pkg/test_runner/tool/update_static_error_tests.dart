// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Regenerates the static error test markers inside static error tests based
/// on the actual errors reported by analyzer and CFE.
import 'dart:io';

import 'package:args/args.dart';
import 'package:glob/glob.dart';

import 'package:test_runner/src/command_output.dart';
import 'package:test_runner/src/test_file.dart';
import 'package:test_runner/src/update_errors.dart';
import 'package:test_runner/src/utils.dart';

const _usage =
    "Usage: dart update_static_error_tests.dart [flags...] <path glob>";

Future<void> main(List<String> args) async {
  var parser = ArgParser();

  parser.addFlag("help", abbr: "h");

  parser.addFlag("dry-run",
      abbr: "n",
      help: "Print result but do not overwrite any files.",
      negatable: false);

  parser.addSeparator("Strip expectations out of the tests:");
  parser.addFlag("remove",
      abbr: "r",
      help: "Remove all existing error expectations.",
      negatable: false);
  parser.addFlag("remove-analyzer",
      help: "Remove existing analyzer error expectations.", negatable: false);
  parser.addFlag("remove-cfe",
      help: "Remove existing CFE error expectations.", negatable: false);

  parser.addSeparator(
      "Insert expectations in the tests based on current front end output:");
  parser.addFlag("insert",
      abbr: "i",
      help: "Insert analyzer and CFE error expectations.",
      negatable: false);
  parser.addFlag("insert-analyzer",
      help: "Insert analyzer error expectations.", negatable: false);
  parser.addFlag("insert-cfe",
      help: "Insert CFE error expectations.", negatable: false);

  parser.addSeparator("Update combines remove and insert:");
  parser.addFlag("update",
      abbr: "u",
      help: "Replace analyzer and CFE error expectations.",
      negatable: false);
  parser.addFlag("update-analyzer",
      help: "Replace analyzer error expectations.", negatable: false);
  parser.addFlag("update-cfe",
      help: "Replace CFE error expectations.", negatable: false);

  var results = parser.parse(args);

  if (results["help"] as bool) {
    print("Regenerates the test markers inside static error tests.");
    print("");
    print(_usage);
    print("");
    print(parser.usage);
    exit(0);
  }

  var dryRun = results["dry-run"] as bool;
  var removeAnalyzer = results["remove-analyzer"] as bool ||
      results["remove"] as bool ||
      results["update-analyzer"] as bool ||
      results["update"] as bool;

  var removeCfe = results["remove-cfe"] as bool ||
      results["remove"] as bool ||
      results["update-cfe"] as bool ||
      results["update"] as bool;

  var insertAnalyzer = results["insert-analyzer"] as bool ||
      results["insert"] as bool ||
      results["update-analyzer"] as bool ||
      results["update"] as bool;

  var insertCfe = results["insert-cfe"] as bool ||
      results["insert"] as bool ||
      results["update-cfe"] as bool ||
      results["update"] as bool;

  if (!removeAnalyzer && !removeCfe && !insertAnalyzer && !insertCfe) {
    _usageError(
        parser, "Must provide at least one flag for an operation to perform.");
  }

  if (results.rest.length != 1) {
    _usageError(
        parser, "Must provide a file path or glob for which tests to update.");
  }

  var glob = Glob(results.rest.single, recursive: true);
  for (var entry in glob.listSync(root: "tests")) {
    if (!entry.path.endsWith(".dart")) continue;

    if (entry is File) {
      await _processFile(entry,
          dryRun: dryRun,
          removeAnalyzer: removeAnalyzer,
          removeCfe: removeCfe,
          insertAnalyzer: insertAnalyzer,
          insertCfe: insertCfe);
    }
  }
}

void _usageError(ArgParser parser, String message) {
  stderr.writeln("Usage error: $message");
  stderr.writeln();
  stderr.writeln(_usage);
  stderr.writeln(parser.usage);
  exit(64);
}

Future<void> _processFile(File file,
    {bool dryRun,
    bool removeAnalyzer,
    bool removeCfe,
    bool insertAnalyzer,
    bool insertCfe}) async {
  stdout.write("${file.path}...");
  var source = file.readAsStringSync();

  var errors = <StaticError>[];
  if (insertAnalyzer) {
    stdout.write("\r${file.path} (Running analyzer...)");
    errors.addAll(await _runAnalyzer(file.path));
  }

  if (insertCfe) {
    // Clear the previous line.
    stdout.write("\r${file.path}                      ");
    stdout.write("\r${file.path} (Running CFE...)");
    errors.addAll(await _runCfe(file.path));
  }

  errors = StaticError.simplify(errors);

  var result = updateErrorExpectations(source, errors,
      removeAnalyzer: removeAnalyzer, removeCfe: removeCfe);

  stdout.writeln("\r${file.path} (Updated with ${errors.length} errors)");

  if (dryRun) {
    print(result);
  } else {
    await file.writeAsString(result);
  }
}

/// Invoke analyzer on [path] and gather all static errors it reports.
Future<List<StaticError>> _runAnalyzer(String path) async {
  // TODO(rnystrom): Running the analyzer command line each time is very slow.
  // Either import the analyzer as a library, or at least invoke it in a batch
  // mode.
  var result = await Process.run(
      "sdk/bin/dartanalyzer$shellScriptExtension", ["--format=machine", path]);
  var errors = <StaticError>[];
  AnalysisCommandOutput.parseErrors(result.stderr as String, errors);
  return errors;
}

/// Invoke CFE on [path] and gather all static errors it reports.
Future<List<StaticError>> _runCfe(String path) async {
  // TODO(rnystrom): Running the CFE command line each time is slow and wastes
  // time generating code, which we don't care about. Import it as a library or
  // at least run it in batch mode.
  var result = await Process.run("sdk/bin/dart",
      ["pkg/front_end/tool/_fasta/compile.dart", "--verify", path]);

  var errors = <StaticError>[];
  FastaCommandOutput.parseErrors(result.stdout as String, errors);

  // Running the above command generates a dill file next to the test, which we
  // don't want, so delete it.
  await File("$path.dill").delete();

  return errors;
}
