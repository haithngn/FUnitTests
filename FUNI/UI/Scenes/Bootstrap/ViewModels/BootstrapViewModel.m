//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "BootstrapViewModel.h"
#import "UserService.h"

@interface BootstrapViewModel () <UserServiceObservable>

@property (nonatomic, strong) NSObject <UserService> * userService;

@end

@implementation BootstrapViewModel {
@private
    NSObject <UserService> *_userService;
}

@synthesize userService = _userService;

- (instancetype)initWithUserService:(NSObject <UserService> *)userService {
    if (self = [super init]) {
        self.userService = userService;
        [userService addObserver:self];
    }

    return self;
}


- (void)load {
    if ([_userService currentUser] != nil) {
        _onSignedIn ? _onSignedIn() : nil;
    } else {
        _onSignedOut ? _onSignedOut() : nil;
    }
}

- (void)currentUserHasBeenChanged {
    [self load];
}


@end
