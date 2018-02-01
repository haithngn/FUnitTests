//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "Storyboards.h"

@interface Storyboards ()

@property (nonatomic, strong) UIStoryboard * main;

@end

@implementation Storyboards

+ (Storyboards *)instance {
    static Storyboards *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (UIStoryboard *)main {
    if (_main == nil) {
        _main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }

    return _main;
}

+ (UIStoryboard *)main {
    return [Storyboards instance].main;
}

@end