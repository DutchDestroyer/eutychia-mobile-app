//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DefaultApi {
  DefaultApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Creates a new account
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AccountCreation] accountCreation (required):
  Future createNewAccountWithHttpInfo(AccountCreation accountCreation) async {
    // Verify required params are set.
    if (accountCreation == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: accountCreation');
    }

    final path = '/signup/create'.replaceAll('{format}', 'json');

    Object postBody = accountCreation;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Creates a new account
  ///
  /// Parameters:
  ///
  /// * [AccountCreation] accountCreation (required):
  Future createNewAccount(AccountCreation accountCreation) async {
    final response = await createNewAccountWithHttpInfo(accountCreation);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
  }

  /// Delete the account with this ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountID (required):
  ///   The ID of the account to return (UUID)
  Future deleteAccountByIDWithHttpInfo(String accountID) async {
    // Verify required params are set.
    if (accountID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: accountID');
    }

    final path = '/accounts/{accountID}'.replaceAll('{format}', 'json')
      .replaceAll('{' + 'accountID' + '}', accountID.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Delete the account with this ID
  ///
  /// Parameters:
  ///
  /// * [String] accountID (required):
  ///   The ID of the account to return (UUID)
  Future deleteAccountByID(String accountID) async {
    final response = await deleteAccountByIDWithHttpInfo(accountID);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
  }

  /// Returns an account by ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountID (required):
  ///   The ID of the account to return (UUID)
  Future<Response> getAccountByIDWithHttpInfo(String accountID) async {
    // Verify required params are set.
    if (accountID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: accountID');
    }

    final path = '/accounts/{accountID}'.replaceAll('{format}', 'json')
      .replaceAll('{' + 'accountID' + '}', accountID.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Returns an account by ID
  ///
  /// Parameters:
  ///
  /// * [String] accountID (required):
  ///   The ID of the account to return (UUID)
  Future<GetAccountIdResponse> getAccountByID(String accountID) async {
    final response = await getAccountByIDWithHttpInfo(accountID);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'GetAccountIdResponse') as GetAccountIdResponse;
    }
    return null;
  }

  /// Get a generic test with specific ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectID (required):
  ///   The ID of the project to return
  ///
  /// * [String] testID (required):
  ///   The ID of the test to return
  Future<Response> getGenericTestOfProjectWithHttpInfo(String projectID, String testID) async {
    // Verify required params are set.
    if (projectID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: projectID');
    }
    if (testID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: testID');
    }

    final path = '/projects/{projectID}/genericTests/{testID}'.replaceAll('{format}', 'json')
      .replaceAll('{' + 'projectID' + '}', projectID.toString())
      .replaceAll('{' + 'testID' + '}', testID.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Get a generic test with specific ID
  ///
  /// Parameters:
  ///
  /// * [String] projectID (required):
  ///   The ID of the project to return
  ///
  /// * [String] testID (required):
  ///   The ID of the test to return
  Future<GenericTest> getGenericTestOfProject(String projectID, String testID) async {
    final response = await getGenericTestOfProjectWithHttpInfo(projectID, testID);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'GenericTest') as GenericTest;
    }
    return null;
  }

  /// returns all projects where this account is involved in
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountID (required):
  ///   The ID of the account
  Future<Response> getProjectsOfAccountWithHttpInfo(String accountID) async {
    // Verify required params are set.
    if (accountID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: accountID');
    }

    final path = '/accounts/{accountID}/projects'.replaceAll('{format}', 'json')
      .replaceAll('{' + 'accountID' + '}', accountID.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// returns all projects where this account is involved in
  ///
  /// Parameters:
  ///
  /// * [String] accountID (required):
  ///   The ID of the account
  Future<ProjectsAccountId> getProjectsOfAccount(String accountID) async {
    final response = await getProjectsOfAccountWithHttpInfo(accountID);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'ProjectsAccountId') as ProjectsAccountId;
    }
    return null;
  }

  /// Get all tests that need to be performed by account
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectID (required):
  ///   The ID of the project to return (UUID)
  ///
  /// * [String] accountID (required):
  ///   The ID of the account to return (UUID)
  Future<Response> getTestsToPerformByAccountWithHttpInfo(String projectID, String accountID) async {
    // Verify required params are set.
    if (projectID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: projectID');
    }
    if (accountID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: accountID');
    }

    final path = '/projects/{projectID}/{accountID}/tests'.replaceAll('{format}', 'json')
      .replaceAll('{' + 'projectID' + '}', projectID.toString())
      .replaceAll('{' + 'accountID' + '}', accountID.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Get all tests that need to be performed by account
  ///
  /// Parameters:
  ///
  /// * [String] projectID (required):
  ///   The ID of the project to return (UUID)
  ///
  /// * [String] accountID (required):
  ///   The ID of the account to return (UUID)
  Future<TestsProject> getTestsToPerformByAccount(String projectID, String accountID) async {
    final response = await getTestsToPerformByAccountWithHttpInfo(projectID, accountID);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'TestsProject') as TestsProject;
    }
    return null;
  }

  /// logging in the account
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LoginAccount] loginAccount (required):
  Future<Response> logInWithAccountWithHttpInfo(LoginAccount loginAccount) async {
    // Verify required params are set.
    if (loginAccount == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: loginAccount');
    }

    final path = '/authentication/login'.replaceAll('{format}', 'json');

    Object postBody = loginAccount;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// logging in the account
  ///
  /// Parameters:
  ///
  /// * [LoginAccount] loginAccount (required):
  Future<AccountDetails> logInWithAccount(LoginAccount loginAccount) async {
    final response = await logInWithAccountWithHttpInfo(loginAccount);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'AccountDetails') as AccountDetails;
    }
    return null;
  }

  /// logging out the account
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LogoutAccount] logoutAccount (required):
  Future logOutWithAccountWithHttpInfo(LogoutAccount logoutAccount) async {
    // Verify required params are set.
    if (logoutAccount == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: logoutAccount');
    }

    final path = '/authentication/revoke'.replaceAll('{format}', 'json');

    Object postBody = logoutAccount;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// logging out the account
  ///
  /// Parameters:
  ///
  /// * [LogoutAccount] logoutAccount (required):
  Future logOutWithAccount(LogoutAccount logoutAccount) async {
    final response = await logOutWithAccountWithHttpInfo(logoutAccount);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
  }

  /// Refresh the access token of the account
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RefreshDetails] refreshDetails (required):
  Future<Response> refreshAccessTokenWithHttpInfo(RefreshDetails refreshDetails) async {
    // Verify required params are set.
    if (refreshDetails == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: refreshDetails');
    }

    final path = '/authentication/refresh'.replaceAll('{format}', 'json');

    Object postBody = refreshDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Refresh the access token of the account
  ///
  /// Parameters:
  ///
  /// * [RefreshDetails] refreshDetails (required):
  Future<JWTAccountDetails> refreshAccessToken(RefreshDetails refreshDetails) async {
    final response = await refreshAccessTokenWithHttpInfo(refreshDetails);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'JWTAccountDetails') as JWTAccountDetails;
    }
    return null;
  }

  /// Sends an email address that needs to be signed up
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SignUp] signUp (required):
  Future sendEmailForSignUpWithHttpInfo(SignUp signUp) async {
    // Verify required params are set.
    if (signUp == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: signUp');
    }

    final path = '/signup'.replaceAll('{format}', 'json');

    Object postBody = signUp;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Sends an email address that needs to be signed up
  ///
  /// Parameters:
  ///
  /// * [SignUp] signUp (required):
  Future sendEmailForSignUp(SignUp signUp) async {
    final response = await sendEmailForSignUpWithHttpInfo(signUp);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
  }

  /// Submit the answer to the specific
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectID (required):
  ///   The ID of the project to return
  ///
  /// * [String] testID (required):
  ///   The ID of the test to return (UUID)
  ///
  /// * [GenericTestAnswers] genericTestAnswers (required):
  Future submitAnswerToTestWithHttpInfo(String projectID, String testID, GenericTestAnswers genericTestAnswers) async {
    // Verify required params are set.
    if (projectID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: projectID');
    }
    if (testID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: testID');
    }
    if (genericTestAnswers == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: genericTestAnswers');
    }

    final path = '/projects/{projectID}/genericTests/{testID}'.replaceAll('{format}', 'json')
      .replaceAll('{' + 'projectID' + '}', projectID.toString())
      .replaceAll('{' + 'testID' + '}', testID.toString());

    Object postBody = genericTestAnswers;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['ApiKeyAuth'];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Submit the answer to the specific
  ///
  /// Parameters:
  ///
  /// * [String] projectID (required):
  ///   The ID of the project to return
  ///
  /// * [String] testID (required):
  ///   The ID of the test to return (UUID)
  ///
  /// * [GenericTestAnswers] genericTestAnswers (required):
  Future submitAnswerToTest(String projectID, String testID, GenericTestAnswers genericTestAnswers) async {
    final response = await submitAnswerToTestWithHttpInfo(projectID, testID, genericTestAnswers);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
  }
}
