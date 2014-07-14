//
//  NEGProfilesViewController.h
//  Negotiation3
//
//  Created by chermann on 7/2/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NEGType.h"
#import "GAITrackedViewController.h"

@interface NEGProfilesViewController : GAITrackedViewController
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id context;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
