//
//  PVUtilities.h
//  Parus
//
//  Created by nekoi on 7/4/14.
//
//

#if TARGET_OS_IPHONE

    #import <UIKit/UIKit.h>
    typedef UIView PVView;
    typedef UIEdgeInsets PVEdgeInsets;


    enum {
        PVLayoutPriorityRequired = UILayoutPriorityRequired,
        PVLayoutPriorityDefaultHigh = UILayoutPriorityDefaultHigh,
        PVLayoutPriorityDefaultLow = UILayoutPriorityDefaultLow,
        PVLayoutPriorityFittingSizeLevel = UILayoutPriorityFittingSizeLevel,
    };
    typedef float PVLayoutPriority;

#elif TARGET_OS_MAC

    #import <AppKit/AppKit.h>

    typedef NSView PVView;
    typedef NSEdgeInsets PVEdgeInsets;

    enum {
        PVLayoutPriorityRequired = NSLayoutPriorityRequired,
        PVLayoutPriorityDefaultHigh = NSLayoutPriorityDefaultHigh,
        PVLayoutPriorityDragThatCanResizeWindow = NSLayoutPriorityDragThatCanResizeWindow,
        PVLayoutPriorityWindowSizeStayPut = NSLayoutPriorityWindowSizeStayPut,
        PVLayoutPriorityDragThatCannotResizeWindow = NSLayoutPriorityDragThatCannotResizeWindow,
        PVLayoutPriorityDefaultLow = NSLayoutPriorityDefaultLow,
        PVLayoutPriorityFittingSizeCompression = NSLayoutPriorityFittingSizeCompression
    };
    typedef float PVLayoutPriority;

#else

    #error Can't identify platform to pick correct View class

#endif
