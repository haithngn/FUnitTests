//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@protocol UserService;

@interface BootstrapViewModel : BaseViewModel

@property (nonatomic, copy) void (^onSignedIn)(void);
@property (nonatomic, copy) void (^onSignedOut)(void);

- (instancetype)initWithUserService:(NSObject<UserService> *) userService;

- (void)load;

@end