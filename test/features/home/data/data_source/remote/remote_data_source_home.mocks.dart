// Mocks generated by Mockito 5.4.4 from annotations
// in mvvm_project/test/features/home/data/data_source/remote/remote_data_source_home.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mvvm_project/features/features_home/data/network/apiHome.dart'
    as _i2;
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ApiHome].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiHome extends _i1.Mock implements _i2.ApiHome {
  MockApiHome() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ModelRepos>> getRepos() => (super.noSuchMethod(
        Invocation.method(
          #getRepos,
          [],
        ),
        returnValue: _i3.Future<List<_i4.ModelRepos>>.value(<_i4.ModelRepos>[]),
      ) as _i3.Future<List<_i4.ModelRepos>>);
}