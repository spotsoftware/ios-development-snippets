//
//  SPTImagePickerController.m
//  UIComponents
//
//  Created by Alessandro Molari on 23/01/14.
//  Copyright (c) 2014 SPOT Software. All rights reserved.
//

#import "SPTImagePickerController.h"


@interface SPTImagePickerController ()

@property (strong, nonatomic) UIImagePickerController *imageController;

@end


@implementation SPTImagePickerController

/**
 * This is the designated initializer
 */
- (id)init
{
    self = [super init];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

/**
 * Perform any custom object initialization
 * Here we set the defaults
 */
- (void)initialize
{
    self.videoPicker = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageController = [[UIImagePickerController alloc] init];
    self.imageController.delegate = self;
    self.imageController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if (self.isVideoPicker) {
        self.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
    }
    
    UIView *overlay = [[UIView alloc] initWithFrame:self.imageController.view.bounds];
    overlay.backgroundColor = [UIColor clearColor];
    overlay.alpha = 0.3;
    overlay.clipsToBounds = NO;
    self.imageController.cameraOverlayView = overlay;
    
    [self.view addSubview:self.imageController.view];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.imageController viewWillAppear:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.imageController viewDidAppear:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)dealloc
{
    self.imageController = nil;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (self.delegate) {
        if (self.isVideoPicker && [self.delegate respondsToSelector:@selector(selectedVideo:)]) {
            [self.delegate selectedVideo:info];
        }
        if (!self.isVideoPicker && [self.delegate respondsToSelector:@selector(selectedPhoto:)]) {
            [self.delegate selectedPhoto:info];
        }
    }
    
    [self dismiss];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismiss];
}

#pragma mark - Handle Orientation

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

#pragma mark -

/**
 * Called upon dismiss
 */
- (void)dismiss
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)setMediaTypes:(NSArray *)mediaTypes
{
    if (self.imageController) {
        self.imageController.mediaTypes = mediaTypes;
    }
}

@end
