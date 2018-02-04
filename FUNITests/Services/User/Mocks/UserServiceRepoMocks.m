//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserServiceRepoMocks.h"
#import "User.h"


@implementation UserServiceRepoMocks {

}
- (User *)findById:(NSString *)userId {
    return [[User alloc] initWithUsername:userId];
}

@end