//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "AuthorizeViewController.h"
#import "AuthorizeViewModel.h"
#import "Dependences.h"

@interface AuthorizeViewController ()

@property (nonatomic, strong) AuthorizeViewModel * model;

@end

@implementation AuthorizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[AuthorizeViewModel alloc] initWithUserService: [Dependences userService]];

    [self bindEvents];
}

- (IBAction)login:(UIButton *)sender {
    [_model login];
}

- (IBAction)updateUsername:(UITextField *)sender {
    _model.username = sender.text;
}

- (IBAction)updatePassword:(UITextField *)sender {
    _model.password = sender.text;
}

- (void)bindEvents {
    __weak typeof(self) weakSelf = self;
    _model.onDisableSubmit = ^(BOOL enable){
        weakSelf.signInButton.enabled = enable;
    };
}

@end
