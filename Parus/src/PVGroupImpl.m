//
//  PVGroupImpl.m
//  Parus
//
//  Created by Алексей Демедецкий on 10.08.13.
//
//

#import "PVGroupImpl.h"
#import "PVGroup.h"

@interface PVGroupImpl ()<PVGroupProtocol>

@property (strong) NSArray* array;

@end


NSObject<PVGroupProtocol>* PVGroup(NSArray* array)
{
    return ({
        PVGroupImpl* group = [PVGroupImpl new];
        group.array = array;
        
        group;
    });
}


@implementation PVGroupImpl

@end
