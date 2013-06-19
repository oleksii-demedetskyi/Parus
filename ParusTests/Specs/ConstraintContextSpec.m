#import "PVConstraintContext.h"

SpecBegin(ConstraintContextSpec)

describe(@"Constraint Context", ^{
    __block PVConstraintContext* context = nil;
    __block UIView* view1 = nil;
    __block UIView* view2 = nil;
    
    beforeEach(^{
        context = [PVConstraintContext new];
        view1 = [UIView new];
        view2 = [UIView new];
    });
    
    it(@"should have constraint built", ^{        
        context.leftView = view1;
        context.leftAttribute = NSLayoutAttributeLeft;
        context.relation = NSLayoutRelationEqual;
        context.rightView = view2;
        context.rightAttribute = NSLayoutAttributeRight;
        context.rightAtttributeMultiplier = 1.0f;
        context.rightConstant = 10.0f;
        context.priority = UILayoutPriorityDefaultLow;
        
        NSLayoutConstraint* constraint = [context buildConstraint];
        expect(constraint.firstItem).to.equal(view1);
        expect(constraint.firstAttribute).to.equal(NSLayoutAttributeLeft);
        expect(constraint.relation).to.equal(NSLayoutRelationEqual);
        expect(constraint.secondItem).to.equal(view2);
        expect(constraint.secondAttribute).to.equal(NSLayoutAttributeRight);
        expect(constraint.multiplier).to.equal(1.0f);
        expect(constraint.constant).to.equal(10.0f);
        expect(constraint.priority).to.equal(UILayoutPriorityDefaultLow);
    });
    
    it(@"should raise left view not set exception", ^{
        expect(^{
            [context buildConstraint];
        }).to.raise(kLeftViewNotSet);
    });
});

SpecEnd