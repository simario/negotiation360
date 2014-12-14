 //
//  NEGNoteViewController.m
//  Negotiation3
//
//  Created by Curtis Wingert on 11/8/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGNoteViewController.h"

@interface NEGNoteViewController ()

@end

@implementation NEGNoteViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (void)setContext:(id)newContext
{
    if (_context != newContext) {
        _context = newContext;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    
    CGRect textViewFrame = CGRectInset(self.view.bounds, 0, 0);
    textViewFrame.size.height -= 216;
    textView.frame = textViewFrame;
    [self.detailItem setValue:[textView text] forKey:@"note"];
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        
        self.textView.text = [[self.detailItem valueForKey:@"note"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
