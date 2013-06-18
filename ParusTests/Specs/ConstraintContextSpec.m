#import "PVConstraintContext.h"

SpecBegin(ConstraintContextSpec)

describe(@"Constrinat Context", ^{
    __block PVConstraintContext* context = nil;
    
    beforeEach(^{
        context = [PVConstraintContext new];
    });
    
    it(@"should have constraint built", ^{
        UIView* view1 = [UIView new];
        UIView* view2 = [UIView new];
        
        context.leftView = view1;
        context.leftAttribute = NSLayoutAttributeLeft;
        context.rightView = view2;
        context.rightAttribute = NSLayoutAttributeRight;
        context.rightAtttributeMultiplier = 1.0f;
        context.rightConstant = 10.0f;
        context.priority = UILayoutPriorityDefaultLow;
        
        NSLayoutConstraint* constraint = [context buildConstraint];
        expect(constraint.firstItem).to.equal(view1);
        expect(constraint.firstAttribute).to.equal(NSLayoutAttributeLeft);
        expect(constraint.secondItem).to.equal(view2);
        expect(constraint.secondAttribute).to.equal(NSLayoutAttributeRight);
        expect(constraint.multiplier).to.equal(1.0f);
        expect(constraint.constant).to.equal(10.0f);
        expect(constraint.priority).to.equal(UILayoutPriorityDefaultLow);
    });
});

SpecEnd