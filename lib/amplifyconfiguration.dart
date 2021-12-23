const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:8aba7716-b803-494f-820b-93e498fb27f2",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_zp9jHHTIz",
                        "AppClientId": "1ni3jmfpsmf164nrg9pqjjkdrk",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "6rwo46y6jf7f-staging.auth.us-east-1.amazoncognito.com",
                            "AppClientId": "1ni3jmfpsmf164nrg9pqjjkdrk",
                            "SignInRedirectURI": "myapp://",
                            "SignOutRedirectURI": "myapp://",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [
                            "FACEBOOK",
                            "GOOGLE"
                        ],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "EMAIL",
                            "GIVEN_NAME",
                            "PICTURE"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": [
                                "REQUIRES_LOWERCASE",
                                "REQUIRES_NUMBERS",
                                "REQUIRES_SYMBOLS",
                                "REQUIRES_UPPERCASE"
                            ]
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://nsrapwi26bdzdilplddgt7hdie.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-6qwxs2x4ljfxfb6nosc5ourplm",
                        "ClientDatabasePrefix": "yrozproject_API_KEY"
                    },
                    "yrozproject_AWS_IAM": {
                        "ApiUrl": "https://nsrapwi26bdzdilplddgt7hdie.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "yrozproject_AWS_IAM"
                    },
                    "yrozproject_AMAZON_COGNITO_USER_POOLS": {
                        "ApiUrl": "https://nsrapwi26bdzdilplddgt7hdie.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "yrozproject_AMAZON_COGNITO_USER_POOLS"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "yrozproject": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://nsrapwi26bdzdilplddgt7hdie.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-6qwxs2x4ljfxfb6nosc5ourplm"
                }
            }
        }
    }
}''';