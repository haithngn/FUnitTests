//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserServiceSessionRepoMocks.h"


@implementation UserServiceSessionRepoMocks {

}
- (NSString *)currentUserId {
    return nil;
}

- (void)setCurrentUserId:(NSString *)userId {
    _username = userId;
}

@end