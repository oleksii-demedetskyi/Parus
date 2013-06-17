#import "PVConstraintContext.h"

SpecBegin(ConstraintContextSpec)

describe(@"Constrinat Context", ^{
    __block PVConstraintContext* context = nil;
    
    beforeEach(^{
        context = [PVConstraintContext new];
    });
    
    it(@"should raise an exception on empty state ", ^{
        expect([context buildConstraint]).to.raiseAny();
    });
    
    it(@"shuold generate correct constraint", ^{

    });
});

SpecEnd