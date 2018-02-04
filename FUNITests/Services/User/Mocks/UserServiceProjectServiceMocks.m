//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserServiceProjectServiceMocks.h"

@interface UserServiceProjectServiceMocks ()

@property (nonatomic, assign) BOOL hasDefaultProj;

@end

@implementation UserServiceProjectServiceMocks {

}

- (instancetype)init {
    if (self = [super init]) {
        _hasDefaultProj = NO;
    }

    return self;
}

- (void)createDefaultProjectsBelongTo:(NSString *)username {
    _hasDefaultProj = YES;
}

@end