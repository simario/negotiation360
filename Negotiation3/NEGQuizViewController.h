//
//  NEGQuizViewController.h
//  Negotiation3
//
//  Created by chermann on 2/22/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEGQuizViewController : UITableViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id context;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *questionValueLabel1;
@property (weak, nonatomic) IBOutlet UILabel *questionValueLabel2;
@property (weak, nonatomic) IBOutlet UILabel *questionValueLabel3;
@property (weak, nonatomic) IBOutlet UILabel *questionValueLabel4;
@property (weak, nonatomic) IBOutlet UIStepper *stepper1;
@property (weak, nonatomic) IBOutlet UIStepper *stepper2;
@property (weak, nonatomic) IBOutlet UIStepper *stepper3;
@property (weak, nonatomic) IBOutlet UIStepper *stepper4;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

@property (strong, nonatomic) NSArray *questionLabels;

@property int total;

- (IBAction)question1ValueChanged:(UIStepper *)sender;
- (IBAction)question2ValueChanged:(UIStepper *)sender;
- (IBAction)question3ValueChanged:(UIStepper *)sender;
- (IBAction)question4ValueChanged:(UIStepper *)sender;


@end
