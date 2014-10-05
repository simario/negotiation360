//
//  NEGScoreCardQuiz1TableViewController.h
//  Negotiation3
//
//  Created by chermann on 9/28/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEGScoreCardQuiz2TableViewController : UITableViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id context;
@property (strong, nonatomic) NSArray *sliderTitles;
@property (strong, nonatomic) NSArray *questionTitles;

- (IBAction)textFieldFinished:(id)sender;
- (IBAction)submit:(id)sender;

@end
