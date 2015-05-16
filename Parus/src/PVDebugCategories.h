//
//  PVDebugCategories.h
//  Parus
//
//  Created by Алексей Демедецкий on 12.07.14.
//
//

#import <Foundation/Foundation.h>

@interface NSLayoutConstraint (PVDebugContext)

@property (nonatomic, readonly) NSString* pv_description;

@end