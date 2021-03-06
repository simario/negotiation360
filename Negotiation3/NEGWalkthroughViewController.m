//
//  NEGWalkthroughViewController.m
//  Negotiation3
//
//  Created by chermann on 3/15/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGWalkthroughViewController.h"
#import "NEGMasterViewController.h"
@interface NEGWalkthroughViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *subTextView;

//@property NEGMasterViewController *masterViewController;

@end

@implementation NEGWalkthroughViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    UIColor *colour = [[UIColor alloc]initWithRed:52.0/255.0 green:170.0/255.0 blue:220.0/255.0 alpha:1.0];
    self.view.backgroundColor = colour;

    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.goButton.hidden = self.goButtonHidden;
    self.subTextView.text = self.subText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButtonPressed:(id)sender {
    
    //[self.masterViewController createProfileObject];
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
