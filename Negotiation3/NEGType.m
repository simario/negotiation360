//
//  NEGType.m
//  Negotiation3
//
//  Created by chermann on 3/23/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGType.h"

@implementation NEGType

-(NSString *)getType:(id)detailItem {
    NSString *result = @"unknown";
    NSString *typeY = @"Y";
    NSString *typeG = @"G";
    NSString *typeGPlus = @"G+";
    NSString *typeW = @"W";
    NSString *typeWPlus = @"W+";
    NSString *typeR = @"R";
    NSString *typeO = @"O";
    NSString *typeX = @"X";
    NSString *typeC = @"C";
    NSString *typeE = @"E";
    
    int create = (int)[[detailItem valueForKey:@"question1"] doubleValue];
    int assert = (int)[[detailItem valueForKey:@"question2"] doubleValue];
    int empathy = (int)[[detailItem valueForKey:@"question3"] doubleValue];
    int claim = (int)[[detailItem valueForKey:@"question4"] doubleValue];
    
    
    // Type X
    if ((create > 12 || empathy > 12 || assert > 12 || claim > 12)) {
        int count = 0;
        
        if (create < 10) {
            count = count + 1;
        }
        if (empathy < 10) {
            count = count + 1;
        }
        if (assert < 10) {
            count = count + 1;
        }
        if (claim < 10) {
            count = count + 1;
        }
        
        if (count > 2) {
            result = typeX;
            return result;
        }
    }
    
    // Type C
    if (create > 10 && assert > 10) {
        result = typeC;
        return result;
    }
    
    // Type E
    if (empathy > 10 && claim > 10) {
        result = typeE;
        return result;
    }
    
    
    // Type G+
    if (create > 11 && empathy > 11 &&
        (assert > 12 || claim > 12)) {
        result = typeGPlus;
        return result;
    }
    
    // Type W+
    if (claim > 11 && assert > 11 &&
        (create > 12 || empathy > 12)) {
        result = typeWPlus;
        return result;
    }
    
    // Type Y
    if (create > 8 && create < 12 &&
        assert > 8 && assert < 12 &&
        empathy > 8 && empathy < 12 &&
        claim > 8 && claim < 12) {
        result = typeY;
        return result;
    }
    
    // Type G
    if (create > 10 && empathy > 10 &&
        (assert > 11 || claim > 11)) {
        result = typeG;
        return result;
    }
    
    // Type W
    if (claim > 10 && assert > 10 &&
        (create > 11 || empathy > 11)) {
        result = typeW;
        return result;
    }
    
    // Type R
    if (empathy > 10 && assert > 10) {
        result = typeR;
        return result;
    }
    
    // Type O
    if (create > 10 && claim > 10) {
        result = typeO;
        return result;
    }
    
    return result;
}

@end
