//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/default_api.dart';

part 'model/account_creation.dart';
part 'model/account_details.dart';
part 'model/answer_to_question.dart';
part 'model/generic_test.dart';
part 'model/generic_test_answers.dart';
part 'model/generic_test_questions.dart';
part 'model/get_account_id_response.dart';
part 'model/jwt_account_details.dart';
part 'model/login_account.dart';
part 'model/logout_account.dart';
part 'model/project.dart';
part 'model/projects_account_id.dart';
part 'model/refresh_details.dart';
part 'model/sign_up.dart';
part 'model/test.dart';
part 'model/tests_project.dart';

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
