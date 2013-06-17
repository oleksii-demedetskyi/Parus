//
//  PVConstraintContext.m
//  Parus
//
//  Created by Алексей Демедецкий on 17.06.13.
//
//

#import "PVConstraintContext.h"

@implementation PVConstraintContext

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.leftView = nil;
        self.leftAttribute = NSLayoutAttributeNotAnAttribute;
        self.relation = NSLayoutRelationEqual;
        self.rightView = nil;
        self.rightAttribute = NSLayoutAttributeNotAnAttribute;
        self.rightAtttributeMultiplier = 0.f;
        self.rightConstant = 0.f;
        self.priority = UILayoutPriorityRequired;
    }
}

- (NSLayoutConstraint *)buildConstraint
{
    NSLayoutConstraint* constraint =
    [NSLayoutConstraint constraintWithItem:self.leftView
                                 attribute:self.leftAttribute
                                 relatedBy:self.relation
                                    toItem:self.rightView
                                 attribute:self.rightAttribute
                                multiplier:self.rightAtttributeMultiplier
                                  constant:self.rightConstant];
    constraint.priority = self.priority;
    
    return constraint;
}

@end
