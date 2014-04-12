//
//  NEGDetailViewController.h
//  Negotiation3
//
//  Created by chermann on 2/22/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEGDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id context;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@end
