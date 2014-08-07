//
//  StoryboardXibController.h
//  CodecademyMobile
//
//  Created by Ian Grossberg on 3/6/14.
//  Copyright (c) 2014 Codecademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryboardXibController : UIViewController

#ifndef IBInspectable
#define IBInspectable
#endif

@property (readwrite) IBInspectable NSString *screenControllerClass;
@property (readwrite) IBInspectable NSString *screenNib;
@property (readwrite) IBInspectable NSString *nibBundleName;

@property (strong, readonly) UIViewController *containedController;

@property (strong, readwrite) void (^containedControllerLoadedHandler)(StoryboardXibController *storyboardXibController);

@end

@protocol StoryboardXibContainedController <NSObject>

@optional
- (void)loadedBy:(StoryboardXibController *)storyboardXibController;

@end