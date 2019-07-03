//
//  AuthorizeViewModelTests.m
//  FUNI
//
//  Created by lcl on 2/5/18.
//  Copyright © 2018 Floware. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AuthorizeViewModelTests.h"
#import "AuthorizeViewModel.h"
#import "LoginUsrServiceMocks.h"

@interface AuthorizeViewModelTests ()

@property (nonatomic, strong) AuthorizeViewModel * model;
@property (nonatomic, strong) LoginUsrServiceMocks * userServiceMocks;

@end

@implementation AuthorizeViewModelTests

- (void)setUp {
    [super setUp];
    _userServiceMocks = [[LoginUsrServiceMocks alloc] init];
    _model = [[AuthorizeViewModel alloc] initWithUserService:_userServiceMocks];
}

- (void)testCallLogin {
    //Given
    
    //When
    [_model login];
    
    //Then
    
    XCTAssertTrue(_userServiceMocks.callLogin, @"Chua call login...");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
