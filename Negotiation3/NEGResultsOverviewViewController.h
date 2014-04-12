//
//  NEGResultsOverviewViewController.h
//  Negotiation3
//
//  Created by chermann on 3/22/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "NEGType.h"

@interface NEGResultsOverviewViewController : UITableViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id context;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *composeButton;

- (IBAction)compose:(UIBarButtonItem *)sender;

@end
