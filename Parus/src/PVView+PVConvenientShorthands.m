//
//  UIView+PVConvenientShorthands.m
//  Parus
//
//  Created by nekoi on 7/5/14.
//
//

#import "PVView+PVConvenientShorthands.h"

#if TARGET_OS_IPHONE
    #define PVViewClass UIView
#elif TARGET_OS_MAC
    #define PVViewClass NSView
#else
    #error Can't identify platform to pick correct View class
#endif

@implementation PVViewClass (PVConvenientShorthands)

- (_PVLocationRelationSelect*)pv_left
{
    return PVLeftOf(self);
}

- (_PVLocationRelationSelect*)pv_right
{
    return PVRightOf(self);
}

- (_PVLocationRelationSelect*)pv_top
{
    return PVTopOf(self);
}

- (_PVLocationRelationSelect*)pv_bottom
{
    return PVBottomOf(self);
}

- (_PVLocationRelationSelect*)pv_leading
{
    return PVLeadingOf(self);
}

- (_PVLocationRelationSelect*)pv_trailing
{
    return PVTrailingOf(self);
}

- (_PVRelationSelect*)pv_width
{
    return PVWidthOf(self);
}

- (_PVRelationSelect*)pv_height
{
    return PVHeightOf(self);
}

- (_PVLocationRelationSelect*)pv_centerX
{
    return PVCenterXOf(self);
}

- (_PVLocationRelationSelect*)pv_centerY
{
    return PVCenterYOf(self);
}

- (_PVLocationRelationSelect*)pv_baseline
{
    return PVBaselineOf(self);
}

@end

#undef PVViewClass
