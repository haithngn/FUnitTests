//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "SettingServiceImpl.h"
#import "SettingRespository.h"

@interface SettingServiceImpl ()

@property (nonatomic, strong) NSObject <SettingRespository> * repository;

@end

@implementation SettingServiceImpl {

}

- (instancetype)initWithRepository:(NSObject <SettingRespository> *)repository {
    if (self = [super init]) {
        self.repository = repository;
    }

    return self;
}

- (void)createSetting:(NSString *)userId {
    [_repository createSetting:userId];
}

@end