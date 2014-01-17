//
//  StatusBar.h
//  SPTCrossversionCompatibility
//
//  Created by Alessandro Molari on 17/01/14.
//  Copyright (c) 2014 SPOT Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StatusBarCompatibilityManager : NSObject

#pragma mark - Singleton instance management

+ (instancetype)sharedInstance;

#pragma mark - Lifecycle

- (instancetype)initWithStartingWidth:(CGFloat)startingWidth startingHeight:(CGFloat)startingHeight;

#pragma mark -

- (void)setupStatusBarAppearanceForWindow:(UIWindow *)window;
- (void)initializeStatusBarAppearanceForWindow:(UIWindow *)window;

@end
