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
    [super viewDidLoad];

    self.confirmationLabel.text = [self.confirmationLabel.text stringByAppendingString:@"\nXib Loaded!"];
    [self.confirmationLabel sizeToFit];
}

- (IBAction)segueThroughParentWithSenderText:(id)sender
{
    [self.storyboardXibController performSegueWithIdentifier:@"Second" sender:@"Psst, pass this on to the second view!"];
}

- (void)storyboardXibLoadedBy:(StoryboardXibController *)storyboardXibController
{
    self.storyboardXibController = storyboardXibController;
    self.storyboardXibController.containedControllerLoadedHandler = ^(StoryboardXibController *storyboardController)
    {
        self.confirmationLabel.text = [self.confirmationLabel.text stringByAppendingString:@"\nStoryboard Notified Me!"];
        [self.confirmationLabel sizeToFit];
    };
}

- (void)storyboardXibWithin:(StoryboardXibController *)storyboardXibController passedSender:(id)sender inSegue:(UIStoryboardSegue *)segue
{
    self.confirmationLabel.text = [self.confirmationLabel.text stringByAppendingString:[NSString stringWithFormat:@"\nPrevious view sent me:\n \"%@\"!", sender] ];
    [self.confirmationLabel sizeToFit];
}

@end
