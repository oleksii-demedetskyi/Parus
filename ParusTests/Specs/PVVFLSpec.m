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
    
    it(@"should create constraints", ^{
        
        NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[view1][view2]"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:NSDictionaryOfVariableBindings(view1,view2)];
        expect(constraints).toNot.beNil();
        
        constraints = PVVFL(@"[view1][view2]").alignAllLeft.leadingToTrailing.withViews(NSDictionaryOfVariableBindings(view1,view2)).metrics(nil).asArray;
        
        expect(constraints).toNot.beNil();
    });
});

SpecEnd