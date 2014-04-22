//
//  CustomViewController.m
//  StoryboardXibControllerDemo
//
//  Created by Ian on 3/22/14.
//  Copyright (c) 2014 Codecademy. All rights reserved.
//

#import "XibViewController.h"

#import "StoryboardXibController.h"

@interface XibViewController ()

@property (weak) StoryboardXibController *storyboardXibController;

@end

@implementation XibViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    if ( [self.parentViewController isKindOfClass:[StoryboardXibController class] ] )
    {
        self.storyboardXibController = (StoryboardXibController *)self.parentViewController;
        self.storyboardXibController.containedControllerLoadedHandler = ^(StoryboardXibController *storyboardController)
        {
            self.confirmationLabel.text = [self.confirmationLabel.text stringByAppendingString:@"Storyboard Notified Me! "];
        };
    }
    [super viewDidLoad];

    self.confirmationLabel.text = [self.confirmationLabel.text stringByAppendingString:@"Xib Loaded! "];
}

@end
