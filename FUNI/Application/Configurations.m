//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "Configurations.h"

@interface Configurations ()

@property (nonatomic, strong) NSString * secret;

@end

@implementation Configurations {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        _secret = @"kAppSecret";
    }

    return self;
}

+ (Configurations *)instance {
    static Configurations *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

@end