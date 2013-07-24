//
//  PV.h
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import <Foundation/Foundation.h>

@protocol PVRelationProtocol;

id<PVRelationProtocol> PVLeftOf(UIView*);

@protocol PVRelationPartProtocol;

@protocol PVRelationProtocol <NSObject>

@property (readonly) id<PVRelationPartProtocol> equalTo;
@property (readonly) id<PVRelationPartProtocol> moreThan;
@property (readonly) id<PVRelationPartProtocol> lessThan;

@end

@protocol PVRelationPartProtocol <NSObject>

@end
