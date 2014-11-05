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

    self.xibLoaded.text = @"YES";
}

- (IBAction)segueThroughParentWithSenderText:(id)sender
{
    [self.storyboardXibController performSegueWithIdentifier:@"Next" sender:@"YES"];
}

- (void)storyboardXibLoadedBy:(StoryboardXibController *)storyboardXibController
{
    self.storyboardXibController = storyboardXibController;
    self.storyboardXibController.containedControllerLoadedHandler = ^(StoryboardXibController *storyboardController)
    {
        self.loadedHandler.text = @"YES";
    };
}

- (void)testForwardingFrom:(id)object
{
    if ( [object conformsToProtocol:@protocol(XibViewController) ] )
    {
        self.forwardConformsToProtocol.text = @"YES";
        
        id<XibViewController> protocol = object;
        if ( [protocol respondsToSelector:@selector(askMe) ] )
        {
            self.forwardRespondsToSelector.text = @"YES";
            
            self.forwardSelectorResult.text = [protocol askMe];
        }
    }
}

- (void)destinationPrepareForSegue:(UIStoryboardSegue *)segue info:(id)info
{
    [self testForwardingFrom:segue.sourceViewController];
    
    self.segueInfo.text = [NSString stringWithFormat:@"%@", info];
}

- (NSString *)askMe
{
    return @"YES";
}

@end
