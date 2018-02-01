//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@protocol UserRepository <NSObject>
@required
- (User*)findById:(NSString *)userId;
@end