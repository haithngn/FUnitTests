//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface User : NSObject
@property (nonatomic, copy) NSString * username;

- (id)initWithUsername:(NSString *)username;

@end