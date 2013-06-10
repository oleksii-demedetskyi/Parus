//
//  LMViewController.m
//  LMLoginExample
//
//  Created by NekOI on 6/9/13.
//  Copyright (c) 2013 LM. All rights reserved.
//

#import "LMViewController.h"

#import "UIView+LMSetup.h"

@interface LMViewController ()

@end

@implementation LMViewController

- (void)loadView
{
    UIView* mainView = [UIView new];
    self.view = mainView;
    
    UIButton* loginButton = [UIButton new];
    loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [loginButton setTitle:@"Sign In" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor blueColor];
    [mainView addSubview:loginButton];
    
    [mainView setupLayout:^(LMMaster *$) {
        $.centerXOf(loginButton).equalTo.centerXOf(mainView);
        $.centerYOf(loginButton).equalTo.centerYOf(mainView);
    }];
    
}

@end
