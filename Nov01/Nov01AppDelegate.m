//
//  Nov01AppDelegate.m
//  Nov01
//
//  Created by Kenneth David on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Nov01AppDelegate.h"
#import "View.h"
#import "ControlView.h"

@implementation Nov01AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIScreen *screen = [UIScreen mainScreen];
    CGRect applicationFrame = screen.applicationFrame;
    controlPct = .25;
    CGRect actionFrame = CGRectMake(applicationFrame.origin.x,
                                    applicationFrame.origin.y,
                                    applicationFrame.size.width,
                                    (1 - controlPct) * applicationFrame.size.height);
    CGRect controlFrame = CGRectMake(applicationFrame.origin.x,
                                     applicationFrame.origin.y + (1 - controlPct) * applicationFrame.size.height,
                                     applicationFrame.size.width,
                                     controlPct * applicationFrame.size.height);
    
    CGRect bounds = screen.bounds;
    
    NSLog(@"application:didFinishLaunchingWithOptions: bounds.origin == (%g, %g), bounds.size == %g × %g",
          bounds.origin.x,
          bounds.origin.y,
          bounds.size.width,
          bounds.size.height);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    view = [[View alloc] initWithFrame: actionFrame];
    [self.window addSubview:view];
    
    controlView = [[ControlView alloc] initWithFrame: controlFrame];
    [self.window addSubview:controlView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
