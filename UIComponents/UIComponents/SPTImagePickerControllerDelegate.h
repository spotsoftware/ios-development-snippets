//
//  SPTImagePickerControllerDelegate.h
//  UIComponents
//
//  Created by Alessandro Molari on 23/01/14.
//  Copyright (c) 2014 SPOT Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SPTImagePickerControllerDelegate <NSObject>

@optional
- (void)selectedVideo:(NSDictionary *)info;
- (void)selectedPhoto:(NSDictionary *)info;

@end
