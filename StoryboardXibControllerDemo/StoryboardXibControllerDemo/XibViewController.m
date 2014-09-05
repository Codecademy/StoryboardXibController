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

    [self appendText:@"\nXib Loaded!"];
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
        [self appendText:@"\nStoryboard Notified Me!"];
    };
}

- (void)testForwardingFrom:(id)object
{
    if ( [object conformsToProtocol:@protocol(XibViewController) ] )
    {
        [self appendText:@"\nSource forwards Protocol!"];
        id<XibViewController> protocol = object;
        if ( [protocol respondsToSelector:@selector(askMe) ] )
        {
            [self appendText:@"\nSource forwards Selector!"];
            
            [self appendText:[NSString stringWithFormat:@"\nSource forwarded: %@!", [protocol askMe] ] ];
        } else
        {
            [self appendText:@"\nSource does not forward Selector!"];
        }
    } else
    {
        [self appendText:@"\n**Error** Source does not forward Protocol!"];
    }
}

- (void)destinationPrepareForSegue:(UIStoryboardSegue *)segue info:(id)info
{
    [self testForwardingFrom:segue.sourceViewController];
    
    [self appendText:[NSString stringWithFormat:@"\nPrevious view sent me:\n \"%@\"!", info] ];
}

- (void)appendText:(NSString *)text
{
    self.confirmationLabel.text = [self.confirmationLabel.text stringByAppendingString:text];
    [self.confirmationLabel sizeToFit];
}

- (NSString *)askMe
{
    return @"Let me tell you";
}

@end
