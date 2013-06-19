#import "LMMaster.h"

SpecBegin(Test)
    
it(@"should do stuff", ^{
    expect(YES).to.beTruthy();
    expect([LMMaster new]).toNot.beNil();
});

describe(@"LMMaster setup", ^{
    
    it(@"should start from where", ^{
        expect(pv_where()).toNot.beNil();
    });
    
});

describe(@"LMMaster", ^{
    __block UIView* view1 = nil;
    __block UIView* view2 = nil;
    
    before(^{
        view1 = [UIView new];
        view2 = [UIView new];
    });
    
    it(@"should allow to build constraint", ^{
        expect(pv_where().widthOf(view1).equalTo.constant(10).asConstraint).toNot.beNil();
        expect(pv_where().heightOf(view1).moreThan.widthOf(view2).asConstraint).toNot.beNil();
        expect(pv_where().leftOf(view1).lessThan.rightOf(view2).withPriority(1000).asConstraint).toNot.beNil();
    });
});

SpecEnd