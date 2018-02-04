//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserServiceSettingServiceMocks.h"

@interface UserServiceSettingServiceMocks ()

@property (nonatomic, assign) BOOL createSetting;

@end

@implementation UserServiceSettingServiceMocks {

}

- (instancetype)init{
    if (self = [super init]) {
        _createSetting = NO;
    }

    return self;
}

- (void)createSetting:(NSString *)userId {
    _createSetting = YES;
}

@end