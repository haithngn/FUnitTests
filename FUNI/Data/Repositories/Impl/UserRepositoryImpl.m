//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserRepositoryImpl.h"
#import "User.h"


@implementation UserRepositoryImpl {

}
- (User *)findById:(NSString *)userId {
    return [[User alloc] initWithUsername:userId];
}

@end