//
//  PVGroupContext.m
//  Parus
//
//  Created by Алексей Демедецкий on 21.08.13.
//
//

#import "PVUtilities.h"
#import "PVGroupContext.h"

@implementation PVGroupContext

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        _direction = NSLayoutFormatDirectionMask;
    }
    return self;
}
@end
