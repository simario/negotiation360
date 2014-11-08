//
//  NEGNoteViewController.h
//  Negotiation3
//
//  Created by Curtis Wingert on 11/8/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEGNoteViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id context;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
