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

@property (weak, nonatomic) IBOutlet UILabel *xibLoaded;
@property (weak, nonatomic) IBOutlet UILabel *loadedHandler;
@property (weak, nonatomic) IBOutlet UILabel *segueInfo;
@property (weak, nonatomic) IBOutlet UILabel *forwardConformsToProtocol;
@property (weak, nonatomic) IBOutlet UILabel *forwardRespondsToSelector;
@property (weak, nonatomic) IBOutlet UILabel *forwardSelectorResult;

@end