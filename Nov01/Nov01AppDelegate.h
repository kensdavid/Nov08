//
//  Nov01AppDelegate.h
//  Nov01
//
//  Created by Kenneth David on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;
@class ControlView;

@interface Nov01AppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    ControlView *controlView;
    UIWindow *_window;
    CGFloat controlPct;
}

@property (strong, nonatomic) UIWindow *window;

@end
