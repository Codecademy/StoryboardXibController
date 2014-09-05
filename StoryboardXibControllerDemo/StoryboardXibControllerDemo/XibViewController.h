//
//  XibViewController.h
//  StoryboardXibControllerDemo
//
//  Created by Ian on 3/22/14.
//  Copyright (c) 2014 Codecademy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StoryboardXibController.h"

@protocol XibViewController <NSObject>

- (NSString *)askMe;

@end

@interface XibViewController : UIViewController<StoryboardXibContainedController, XibViewController>

@property (readwrite, weak) IBOutlet UILabel *confirmationLabel;

@end