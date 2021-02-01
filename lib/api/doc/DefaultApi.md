# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://app.insertname.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createNewAccount**](DefaultApi.md#createNewAccount) | **POST** /signup/create | 
[**deleteAccountByID**](DefaultApi.md#deleteAccountByID) | **DELETE** /accounts/{accountID} | 
[**getAccountByID**](DefaultApi.md#getAccountByID) | **GET** /accounts/{accountID} | 
[**getGenericTestOfProject**](DefaultApi.md#getGenericTestOfProject) | **GET** /projects/{projectID}/genericTests/{testID} | 
[**getProjectsOfAccount**](DefaultApi.md#getProjectsOfAccount) | **GET** /accounts/{accountID}/projects | 
[**getTestsToPerformByAccount**](DefaultApi.md#getTestsToPerformByAccount) | **GET** /projects/{projectID}/{accountID}/tests | 
[**logInWithAccount**](DefaultApi.md#logInWithAccount) | **POST** /authentication/login | 
[**logOutWithAccount**](DefaultApi.md#logOutWithAccount) | **POST** /authentication/revoke | 
[**refreshAccessToken**](DefaultApi.md#refreshAccessToken) | **POST** /authentication/refresh | 
[**sendEmailForSignUp**](DefaultApi.md#sendEmailForSignUp) | **POST** /signup | 
[**submitAnswerToTest**](DefaultApi.md#submitAnswerToTest) | **POST** /projects/{projectID}/genericTests/{testID} | 


# **createNewAccount**
> createNewAccount(accountCreation)



Creates a new account

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final accountCreation = AccountCreation(); // AccountCreation | 

try { 
    api_instance.createNewAccount(accountCreation);
} catch (e) {
    print('Exception when calling DefaultApi->createNewAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountCreation** | [**AccountCreation**](AccountCreation.md)|  | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteAccountByID**
> deleteAccountByID(accountID)



Delete the account with this ID

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final accountID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a1; // String | The ID of the account to return (UUID)

try { 
    api_instance.deleteAccountByID(accountID);
} catch (e) {
    print('Exception when calling DefaultApi->deleteAccountByID: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountID** | **String**| The ID of the account to return (UUID) | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountByID**
> GetAccountIdResponse getAccountByID(accountID)



Returns an account by ID

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final accountID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a1; // String | The ID of the account to return (UUID)

try { 
    final result = api_instance.getAccountByID(accountID);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getAccountByID: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountID** | **String**| The ID of the account to return (UUID) | 

### Return type

[**GetAccountIdResponse**](GetAccountIdResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGenericTestOfProject**
> GenericTest getGenericTestOfProject(projectID, testID)



Get a generic test with specific ID

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final projectID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a2; // String | The ID of the project to return
final testID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a2; // String | The ID of the test to return

try { 
    final result = api_instance.getGenericTestOfProject(projectID, testID);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getGenericTestOfProject: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectID** | **String**| The ID of the project to return | 
 **testID** | **String**| The ID of the test to return | 

### Return type

[**GenericTest**](GenericTest.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectsOfAccount**
> ProjectsAccountId getProjectsOfAccount(accountID)



returns all projects where this account is involved in

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final accountID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a1; // String | The ID of the account

try { 
    final result = api_instance.getProjectsOfAccount(accountID);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getProjectsOfAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountID** | **String**| The ID of the account | 

### Return type

[**ProjectsAccountId**](ProjectsAccountId.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTestsToPerformByAccount**
> TestsProject getTestsToPerformByAccount(projectID, accountID)



Get all tests that need to be performed by account

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final projectID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a2; // String | The ID of the project to return (UUID)
final accountID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a2; // String | The ID of the account to return (UUID)

try { 
    final result = api_instance.getTestsToPerformByAccount(projectID, accountID);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getTestsToPerformByAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectID** | **String**| The ID of the project to return (UUID) | 
 **accountID** | **String**| The ID of the account to return (UUID) | 

### Return type

[**TestsProject**](TestsProject.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logInWithAccount**
> AccountDetails logInWithAccount(loginAccount)



logging in the account

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final loginAccount = LoginAccount(); // LoginAccount | 

try { 
    final result = api_instance.logInWithAccount(loginAccount);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->logInWithAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginAccount** | [**LoginAccount**](LoginAccount.md)|  | 

### Return type

[**AccountDetails**](AccountDetails.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logOutWithAccount**
> logOutWithAccount(logoutAccount)



logging out the account

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final logoutAccount = LogoutAccount(); // LogoutAccount | 

try { 
    api_instance.logOutWithAccount(logoutAccount);
} catch (e) {
    print('Exception when calling DefaultApi->logOutWithAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **logoutAccount** | [**LogoutAccount**](LogoutAccount.md)|  | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshAccessToken**
> JWTAccountDetails refreshAccessToken(refreshDetails)



Refresh the access token of the account

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final refreshDetails = RefreshDetails(); // RefreshDetails | 

try { 
    final result = api_instance.refreshAccessToken(refreshDetails);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->refreshAccessToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshDetails** | [**RefreshDetails**](RefreshDetails.md)|  | 

### Return type

[**JWTAccountDetails**](JWTAccountDetails.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendEmailForSignUp**
> sendEmailForSignUp(signUp)



Sends an email address that needs to be signed up

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final signUp = SignUp(); // SignUp | 

try { 
    api_instance.sendEmailForSignUp(signUp);
} catch (e) {
    print('Exception when calling DefaultApi->sendEmailForSignUp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signUp** | [**SignUp**](SignUp.md)|  | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **submitAnswerToTest**
> submitAnswerToTest(projectID, testID, genericTestAnswers)



Submit the answer to the specific

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: ApiKeyAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('ApiKeyAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = DefaultApi();
final projectID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a2; // String | The ID of the project to return
final testID = 0a8ba9ad-a93d-4991-8c23-c178b09fe6a2; // String | The ID of the test to return (UUID)
final genericTestAnswers = GenericTestAnswers(); // GenericTestAnswers | 

try { 
    api_instance.submitAnswerToTest(projectID, testID, genericTestAnswers);
} catch (e) {
    print('Exception when calling DefaultApi->submitAnswerToTest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectID** | **String**| The ID of the project to return | 
 **testID** | **String**| The ID of the test to return (UUID) | 
 **genericTestAnswers** | [**GenericTestAnswers**](GenericTestAnswers.md)|  | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

