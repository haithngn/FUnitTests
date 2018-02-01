//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginParams : NSObject

@property (nonatomic, readonly) NSString * username;
@property (nonatomic, readonly) NSString * password;

- (instancetype)initWithUsername:(NSString*)username password:(NSString*)password;

@end