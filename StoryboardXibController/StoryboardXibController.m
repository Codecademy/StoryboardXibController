//
//  StoryboardXibController.m
//  CodecademyMobile
//
//  Created by Ian Grossberg on 3/6/14.
//  Copyright (c) 2014 Codecademy. All rights reserved.
//

#import "StoryboardXibController.h"

@interface StoryboardXibController ()

@property (strong, readwrite) NSTimer *containedViewDidLoadCheck; //HACK

@end

@implementation StoryboardXibController

@synthesize containedController = _containedController;

-( void )setValue:( id )value forUndefinedKey:( NSString* )key
{
    NSString *error = [NSString stringWithFormat:@"Unable to set value %@ for member %@ on object %p of type %@, member does not exist",
                       value,
                       key,
                       self,
                       [self class] ];
    // block iOS' default exception behavior
#ifdef NSLogError
    NSLogError(@"%@", error);
#else
    NSLog(@"Error: %@", error);
#endif
}

- (void)createSubViewController
{
    Class screenControllerClass;
    if (self.screenControllerClass)
    {
        screenControllerClass = NSClassFromString(self.screenControllerClass);
    }
    
    // TODO: report invalid class or nib file not found, each explicitly
    if ( [screenControllerClass isSubclassOfClass:[UIViewController class] ] && self.screenNib)
    {
        _containedController = [ [screenControllerClass alloc] initWithNibName:self.screenNib bundle:[NSBundle mainBundle] ];
        [self addChildViewController:self.containedController];

        // yes, getters should not be used for side effects UIKit, but why you gotta only start loading when I do??
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-value" // not working
        self.containedController.view;
#pragma cland diagnostic pop

        [self checkContainedViewDidLoad];
    } else
    {
        NSString *error = [NSString stringWithFormat:@"Error with screen controller class %@ and screen nib %@", self.screenControllerClass, self.screenNib];
#ifdef NSLogError
        NSLogError(@"%@", error);
#else
        NSLog(@"Error: %@", error);
#endif
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createSubViewController];
}

- (BOOL)checkContainedViewDidLoad
{
    if (self.containedController.isViewLoaded)
    {
        self.containedViewDidLoadCheck = nil;
        
        UIView *containedView = self.containedController.view;
        [containedView setFrame:self.view.bounds];
        [self.view addSubview:containedView];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containedView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1.0f
                                                               constant:0.0] ];

        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containedView
                                                              attribute:NSLayoutAttributeLeft
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeLeft
                                                             multiplier:1.0f
                                                               constant:0.0] ];

        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containedView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0f
                                                               constant:0.0] ];

        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containedView
                                                              attribute:NSLayoutAttributeRight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeRight
                                                             multiplier:1.0f
                                                               constant:0.0] ];
        
        if ( [self.containedController conformsToProtocol:@protocol(StoryboardXibContainedController) ] )
        {
            id<StoryboardXibContainedController> protocol = (id<StoryboardXibContainedController>)self.containedController;
            if ( [protocol respondsToSelector:@selector(loadedBy:) ] )
            {
                [protocol loadedBy:self];
            }
        }
        
        if (self.containedControllerLoadedHandler)
        {
            self.containedControllerLoadedHandler(self);
        }

    } else
    {
        self.containedViewDidLoadCheck = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(checkContainedViewDidLoad) userInfo:nil repeats:NO];
        
        NSString *verboseLog = [NSString stringWithFormat:@"Waiting for storyboard xib controller's %@ and screen nib %@ to load", self.screenControllerClass, self.screenNib];
#ifdef NSLogVerbose
        NSLogVerbose(@"%@", verboseLog);
#else
        NSLog(@"Verbose: %@", verboseLog);
#endif
    }
    
    return self.containedController.isViewLoaded;
}

@end
