//
//  PVGroupImpl.m
//  Parus
//
//  Created by Алексей Демедецкий on 10.08.13.
//
//

#import "PVGroupImpl.h"
#import "PVGroup.h"

@interface PVGroupImpl ()<_PVGroupProtocol>

@property (copy) NSArray* array;

@end

NSObject<_PVGroupProtocol>* PVGroup(NSArray* array)
{
    return ({
        PVGroupImpl* group = [PVGroupImpl new];
        group.array = array;
        
        group;
    });
}

@implementation PVGroupImpl


#pragma mark - Array conversion

- (NSArray *)asArray
{
    NSMutableArray* result = [NSMutableArray new];
    
    // TODO: Implement mapping
    return [result copy];
}

#pragma mark - Metrics

- (_PVGroupWithMetricsBlock)withMetrics
{
    return ^(NSDictionary* metrics){
        return self;
    };
}

#pragma mark - Views

- (_PVGroupWithViewsBlock)withViews
{
    return ^(NSDictionary* views){
        return self;
    };
}

#pragma mark - Direction

- (_PVGroupDiretionChooseResult)applyDirection:(NSLayoutFormatOptions)opt
{
    return self;
}

- (_PVGroupDiretionChooseResult)fromLeadingToTrailing
{
    return [self applyDirection:NSLayoutFormatDirectionLeadingToTrailing];
}

- (_PVGroupDiretionChooseResult)fromLeftToRight
{
    return [self applyDirection:NSLayoutFormatDirectionLeftToRight];
}

- (_PVGroupDiretionChooseResult)fromRightToLeft
{
    return [self applyDirection:NSLayoutFormatDirectionRightToLeft];
}

@end
