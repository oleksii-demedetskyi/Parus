#import "PVVFL.h"

SpecBegin(PVVFL)

describe(@"PVVFL", ^{
    __block UIView* view1 = nil;
    __block UIView* view2 = nil;
    
    before(^{
        view1 = [UIView new];
        view2 = [UIView new];
        UIView* container = [UIView new];
        [container addSubview:view1];
        [container addSubview:view2];
    });
    
    it(@"should be created", ^{
        expect(vfl(@"[view1][view2]").options(NSLayoutFormatAlignAllTop).withMetrics(nil).andViews(NSDictionaryOfVariableBindings(view1,view2)).asConstraints).toNot.beNil();
    });
});

SpecEnd