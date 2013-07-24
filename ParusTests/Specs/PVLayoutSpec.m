#import "PVLayout.h"

#import "PVConstraintContext.h"

SpecBegin(PVSpec)

describe(@"PVLeftOf", ^{
    it(@"should raise when argument is nil", ^{
        expect(^{
            PVLeftOf(nil);
        }).to.raiseAny();
    });
    
    context(@"has valid given left view", ^{
        __block UIView* view1 = nil;
        
        beforeEach(^{
            view1 = [UIView new];
        });
        
        it(@"should return id<PVRelationProtocol> object", ^{
            id returnedObj = PVLeftOf(view1);
            BOOL isConforms = [returnedObj conformsToProtocol:@protocol(PVRelationProtocol)];
            expect(isConforms).to.beTruthy();
        });
    });
    
    
    
});

SpecEnd