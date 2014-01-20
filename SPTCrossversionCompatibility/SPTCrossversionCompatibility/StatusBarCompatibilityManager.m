//
//  StatusBar.m
//  SPTCrossversionCompatibility
//
//  Created by Alessandro Molari on 17/01/14.
//  Copyright (c) 2014 SPOT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusBarCompatibilityManager.h"


@interface StatusBarCompatibilityManager ()

@property (nonatomic) CGFloat startingWidth;
@property (nonatomic) CGFloat startingHeight;

@end


@implementation StatusBarCompatibilityManager

#pragma mark - Singleton instance management

+ (instancetype)sharedInstance
{
    static StatusBarCompatibilityManager *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

#pragma mark - Lifecycle

- (id)init
{
    self = [super init];
    
    if (self) {
        [self initialize];
        [self initializeWithStartingWidth:768 startingHeight:1024];
    }
    
    return self;
}

- (instancetype)initWithStartingWidth:(CGFloat)startingWidth startingHeight:(CGFloat)startingHeight
{
    self = [super init];
    
    if (self) {
        [self initialize];
        [self initializeWithStartingWidth:startingWidth startingHeight:startingHeight];
    }
    
    return self;
}

/**
 * Perform any custom object initialization
 */
- (void)initialize
{
}

/**
 * Initialize the starting width and the starting height
 */
- (void)initializeWithStartingWidth:(CGFloat)startingWidth startingHeight:(CGFloat)startingHeight
{
    self.startingWidth = startingWidth;
    self.startingHeight = startingHeight;
}

#pragma mark -

- (void)registerForStatusBarOrientationChangeNotifications:(id)subject usingSelector:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:subject
                                             selector:selector
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
}

/**
 *  Setup the status bar for the first time
 *
 *  Usage example:
 *
 *  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 *  {
 *      // ...
 *      [self.window makeKeyAndVisible];
 *      [[StatusBarCompatibilityManager sharedInstance] initializeStatusBarAppearance];
 *      // ...
 *  }
 */
- (void)initializeStatusBarAppearanceForWindow:(UIWindow *)window
{
    self.startingWidth = window.frame.size.width;
    self.startingHeight = window.frame.size.height;
    
    [self setupStatusBarAppearanceForWindow:window];
}

/**
 *  Setup the status bar by using the stored sizes
 */
- (void)setupStatusBarAppearanceForWindow:(UIWindow *)window
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
        window.clipsToBounds = YES;
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        
        if (orientation == UIInterfaceOrientationLandscapeLeft) {
            window.frame =  CGRectMake(20, 0, self.startingWidth, self.startingHeight);
            window.bounds = CGRectMake(20, 0, self.startingWidth, self.startingHeight);
        } else if (orientation == UIInterfaceOrientationLandscapeRight) {
            window.frame = CGRectMake(-20, 0, self.startingWidth, self.startingHeight);
            window.bounds = CGRectMake(-20, 0, self.startingWidth, self.startingHeight);
        } else if (orientation == UIInterfaceOrientationPortrait) {
            window.frame = CGRectMake(0, 20, self.startingWidth, self.startingHeight);
            window.bounds = CGRectMake(0, 20, self.startingWidth, self.startingHeight);
        } else { // orientation == UIInterfaceOrientationPortraitUpsideDown
            window.frame = CGRectMake(0, -20, self.startingWidth, self.startingHeight);
            window.bounds = CGRectMake(0, -20, self.startingWidth, self.startingHeight);
        }
    }
}

@end
