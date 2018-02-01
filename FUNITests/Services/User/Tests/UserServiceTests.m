//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserServiceTests.h"
#import "UserService.h"
#import "LoginParams.h"

@interface UserServiceTests ()

@property (nonatomic, strong) NSObject <UserService> * userService;

@end

@implementation UserServiceTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testLogin {
    //Given
    LoginParams * params = [[LoginParams alloc] initWithUsername:@"usernamenepa" password:@"tuyetmat"];

    //When
    [_userService login:params handler:^(NSError *error, User *user) {
        //Then
        XCTAssertEqual(@"usernamenepa", _apiMock.username, "User service must keep original parameter username when call request login");
    }];
}

- (void)testLogout {
    NSLog(@"Testing logout ...");
}

@end