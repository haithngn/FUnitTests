//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserServiceTests.h"
#import "UserService.h"
#import "LoginParams.h"
#import "UserServiceImpl.h"
#import "UserServiceRepoMocks.h"
#import "UserServiceSessionRepoMocks.h"
#import "UserServiceApiMocks.h"
#import "UserServiceSettingServiceMocks.h"
#import "UserServiceProjectServiceMocks.h"

@interface UserServiceTests ()

@property (nonatomic, strong) NSObject <UserService> * userService;
@property (nonatomic, strong) UserServiceRepoMocks * userRepoMocks;
@property (nonatomic, strong) UserServiceSessionRepoMocks * sessionRepoMocks;
@property (nonatomic, strong) UserServiceApiMocks * apiMocks;
@property (nonatomic, strong) UserServiceSettingServiceMocks * settingServiceMocks;
@property (nonatomic, strong) UserServiceProjectServiceMocks * projectServiceMocks;
@end

@implementation UserServiceTests

- (void)setUp {
    [super setUp];
    NSLog(@"setUp");
    _userRepoMocks = [[UserServiceRepoMocks alloc] init];
    _sessionRepoMocks = [[UserServiceSessionRepoMocks alloc] init];
    _apiMocks = [[UserServiceApiMocks alloc] init];
    _settingServiceMocks = [[UserServiceSettingServiceMocks alloc] init];
    _projectServiceMocks = [[UserServiceProjectServiceMocks alloc] init];
    _userService = [[UserServiceImpl alloc] initWithUserRepository:_userRepoMocks
                                                 sessionRepository:_sessionRepoMocks
                                                               api:_apiMocks
                                                    settingService:_settingServiceMocks
                                                    projectService:_projectServiceMocks];
}

- (void)tearDown {
    [super tearDown];
    NSLog(@"tearDown");
}

- (void)testLogin {
    //Given
    LoginParams * params = [[LoginParams alloc] initWithUsername:@"usernamenepa" password:@"tuyetmat"];

    //When
    [_userService login:params handler:^(NSError *error, User *user) {
        //Then
    }];
}

- (void)testCreateSettingAfterSignedIn {
    //Given
    LoginParams * params = [[LoginParams alloc] initWithUsername:@"usernamenepa" password:@"tuyetmat"];

    //When
    [_userService login:params handler:^(NSError *error, User *user) {
        //Then
    }];
}

- (void)testLogout {
    NSLog(@"Testing logout ...");
}

@end