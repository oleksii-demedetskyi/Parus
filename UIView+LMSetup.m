//
//  UIView+LMSetup.m
//  PriceSnap
//
//  Created by Alexey Demedetskiy on 28.05.13.
//  Copyright (c) 2013 Ciklum. All rights reserved.
//

#import "UIView+LMSetup.h"

@implementation UIView (LMSetup)

- (void)setupLayout:(LMSetupBlock)setup
{
    LMMaster* master = nil;
    setup(master);
    [master processLayout];
}

@end
