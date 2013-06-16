#import "LMMaster.h"

SpecBegin(Test)
    
it(@"should do stuff", ^{
    expect(YES).to.beTruthy();
    expect([LMMaster new]).toNot.beNil();
});

SpecEnd