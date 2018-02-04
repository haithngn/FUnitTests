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
#import "Configurations.h"

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
                                                    projectService:_projectServiceMocks
                                                    configurations:[Configurations instance]];
}

- (void)tearDown {
    [super tearDown];
    NSLog(@"tearDown");
}

- (void)testCallUserApi {
    //Given
    NSString * usr = @"haideptrai";
    NSString * pwd = @"confirmed";
    LoginParams * params = [[LoginParams alloc] initWithUsername:usr password:pwd];

    //When
    [_userService login:params handler:nil];

    //Then
    NSString * hashPwd = [NSString stringWithFormat:@"%@_%@", pwd, [Configurations instance].secret];
    NSLog(@"%@", hashPwd);
    NSLog(@"%@", _apiMocks.pwd);
    XCTAssertTrue([usr isEqualToString:_apiMocks.usr], @"Dung co doi user name");
    XCTAssertTrue([hashPwd isEqualToString:_apiMocks.pwd], @"Hash sai password roi em");
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

- (void)testCreateSetting {
    //Given
    LoginParams * params = [[LoginParams alloc] initWithUsername:@"usernamenepa" password:@"tuyetmat"];

    //When
    [_userService login:params handler:nil];

    XCTAssertTrue(_settingServiceMocks.createSetting, @"You must create setting after sign in");
}

- (void)testCreateDefaultProject {
    //Given
    LoginParams * params = [[LoginParams alloc] initWithUsername:@"usernamenepa" password:@"tuyetmat"];

    //When
    [_userService login:params handler:nil];

    XCTAssertTrue(_projectServiceMocks.hasDefaultProj, @"You must call create default projs after sign in");

}

- (void)testLogout {
    NSLog(@"Testing logout ...");
}

@end
