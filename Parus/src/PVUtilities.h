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


    typedef float PVLayoutPriority;
    static const PVLayoutPriority PVLayoutPriorityRequired = UILayoutPriorityRequired;
    static const PVLayoutPriority PVLayoutPriorityDefaultHigh = UILayoutPriorityDefaultHigh;
    static const PVLayoutPriority PVLayoutPriorityDefaultLow = UILayoutPriorityDefaultLow;
    static const PVLayoutPriority PVLayoutPriorityFittingSizeLevel = UILayoutPriorityFittingSizeLevel;


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
