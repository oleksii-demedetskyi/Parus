//
//  PVGroupContext.h
//  Parus
//
//  Created by Алексей Демедецкий on 21.08.13.
//
//

@import Foundation;

@interface PVGroupContext : NSObject

@property (strong) NSDictionary* views;
@property (strong) NSDictionary* metrics;
@property (assign) NSLayoutFormatOptions direction;

@end
