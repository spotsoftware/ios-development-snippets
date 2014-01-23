//
//  SPTImagePickerController.h
//  UIComponents
//
//  Created by Alessandro Molari on 23/01/14.
//  Copyright (c) 2014 SPOT Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "SPTImagePickerControllerDelegate.h"


@interface SPTImagePickerController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

#pragma mark - Lifecycle

//- (instancetype)initPhotoPicker;
//- (instancetype)initVideoPicker;

#pragma mark - Delegation

@property (weak, nonatomic) id<SPTImagePickerControllerDelegate> delegate;

#pragma mark -

@property (nonatomic, getter = isVideoPicker) BOOL videoPicker;
@property (weak, nonatomic) NSArray *mediaTypes;

@end
