//
//  UIView+LMSetup.h
//  PriceSnap
//
//  Created by Alexey Demedetskiy on 28.05.13.
//  Copyright (c) 2013 Ciklum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMMaster.h"

typedef void(^LMSetupBlock)(LMMaster* $);
@interface UIView (LMSetup)

- (void)setupLayout:(LMSetupBlock)setup;

@end
