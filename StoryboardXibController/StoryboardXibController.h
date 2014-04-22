//
//  StoryboardXibController.h
//  CodecademyMobile
//
//  Created by Ian Grossberg on 3/6/14.
//  Copyright (c) 2014 Codecademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryboardXibController : UIViewController

@property (readwrite) NSString *screenControllerClass;
@property (readwrite) NSString *screenNib;

@property (strong, readonly) UIViewController *containedController;

@end
