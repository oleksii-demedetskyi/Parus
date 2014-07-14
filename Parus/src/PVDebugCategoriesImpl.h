//
//  PVDebugCategoriesImpl.h
//  Parus
//
//  Created by Алексей Демедецкий on 12.07.14.
//
//

#import <Foundation/Foundation.h>
#import "PVDebugCategories.h"

@class PVSingleConstraintDebugContext;
@interface NSLayoutConstraint (PVDebugContextImpl)

- (void)attachDebugContext:(PVSingleConstraintDebugContext*)context;

@end