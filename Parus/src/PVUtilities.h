//
//  PVUtilities.h
//  Parus
//
//  Created by nekoi on 7/4/14.
//
//

@import Foundation;

#if TARGET_OS_IPHONE

    @import UIKit;

    typedef UIView PVView;
    typedef UIEdgeInsets PVEdgeInsets;

    typedef float PVLayoutPriority;
    static const PVLayoutPriority PVLayoutPriorityRequired = UILayoutPriorityRequired;
    static const PVLayoutPriority PVLayoutPriorityDefaultHigh = UILayoutPriorityDefaultHigh;
    static const PVLayoutPriority PVLayoutPriorityDefaultLow = UILayoutPriorityDefaultLow;
    static const PVLayoutPriority PVLayoutPriorityFittingSizeLevel = UILayoutPriorityFittingSizeLevel;

#elif TARGET_OS_MAC

    @import AppKit;

    typedef NSView PVView;
    typedef NSEdgeInsets PVEdgeInsets;

    typedef float PVLayoutPriority;
    static const PVLayoutPriority PVLayoutPriorityRequired = NSLayoutPriorityRequired;
    static const PVLayoutPriority PVLayoutPriorityDefaultHigh = NSLayoutPriorityDefaultHigh;
    static const PVLayoutPriority PVLayoutPriorityDragThatCanResizeWindow = NSLayoutPriorityDragThatCanResizeWindow;
    static const PVLayoutPriority PVLayoutPriorityWindowSizeStayPut = NSLayoutPriorityWindowSizeStayPut;
    static const PVLayoutPriority PVLayoutPriorityDragThatCannotResizeWindow = NSLayoutPriorityDragThatCannotResizeWindow;
    static const PVLayoutPriority PVLayoutPriorityDefaultLow = NSLayoutPriorityDefaultLow;
    static const PVLayoutPriority PVLayoutPriorityFittingSizeCompression = NSLayoutPriorityFittingSizeCompression;

#else

    #error Can't identify platform to pick correct View class

#endif
