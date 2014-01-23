//
//  SPTFirstViewController.m
//  UIComponentsUsageExample
//
//  Created by Alessandro Molari on 23/01/14.
//  Copyright (c) 2014 SPOT Software. All rights reserved.
//

#import "SPTImagePickerExampleViewController.h"
#import "SPTImagePickerController.h"


@interface SPTImagePickerExampleViewController ()

@end


@implementation SPTImagePickerExampleViewController

#pragma mark - Lifecycle

#pragma mark - Actions

- (IBAction)btnTakePhoto:(id)sender
{
    SPTImagePickerController *controller = [[SPTImagePickerController alloc] init];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)btnTakeVideo:(id)sender
{
    SPTImagePickerController *controller = [[SPTImagePickerController alloc] init];
    controller.videoPicker = YES;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
