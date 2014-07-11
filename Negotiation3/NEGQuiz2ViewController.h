//
//  NEGQuiz2ViewController.h
//  Negotiation3
//
//  Created by chermann on 3/23/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEGQuiz2ViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id context;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *questionValueLabel5;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
