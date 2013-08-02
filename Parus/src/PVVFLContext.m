//
//  PVVFLContext.m
//  Parus
//
//  Created by Andrey Moskvin on 8/2/13.
//
//

#import "PVVFLContext.h"

@implementation PVVFLContext

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.format = nil;
        self.alignmentOptions = 0;
        self.directionOptions = 0;
        self.views = nil;
        self.metrics = nil;
    }
    return self;
}

- (NSArray *)buildConstraints
{
    NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:self.format
                                                                   options:0 //self.alignmentOptions | self.directionOptions
                                                                   metrics:self.views
                                                                     views:self.metrics];
    return constraints;
}

@end
