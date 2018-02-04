//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionRepository.h"


@interface UserServiceSessionRepoMocks : NSObject <SessionRepository>

@property (nonatomic, readonly) NSString * username;

@end