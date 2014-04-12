//
//  NEGWalkthroughViewController.h
//  Negotiation3
//
//  Created by chermann on 3/15/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEGWalkthroughViewController : UIViewController

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@property NSString *subText;
@property BOOL goButtonHidden;
@property (weak, nonatomic) IBOutlet UIButton *goButton;

- (IBAction)goButtonPressed:(id)sender;

@end
