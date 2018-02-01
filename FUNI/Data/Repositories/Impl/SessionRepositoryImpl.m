//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "SessionRepositoryImpl.h"

NSString *const kUserId = @"CurrentUserId";

@implementation SessionRepositoryImpl {

}

- (NSString *)currentUserId {
    NSUserDefaults * df = [NSUserDefaults standardUserDefaults];
    return [df valueForKey:kUserId];
}

- (void)setCurrentUserId:(NSString *)userId {
    NSUserDefaults * df = [NSUserDefaults standardUserDefaults];
    [df setValue:userId forKey:kUserId];
}

@end