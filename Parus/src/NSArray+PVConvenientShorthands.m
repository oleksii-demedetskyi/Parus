//
//  NSArray+PVConvenientShorthands.m
//  Parus
//
//  Created by nekoi on 7/6/14.
//
//

#import "NSArray+PVConvenientShorthands.h"

@implementation NSArray (PVConvenientShorthands)

- (_PVGroup*)pv_group
{
    return PVGroup(self);
}

@end
