//
//  PVGroupContext.h
//  Parus
//
//  Created by Алексей Демедецкий on 21.08.13.
//
//

@interface PVGroupContext : NSObject

@property (strong) NSDictionary* views;
@property (strong) NSDictionary* metrics;
@property (assign) NSLayoutFormatOptions direction;
@property (assign) PVLayoutPriority priority;

@end
