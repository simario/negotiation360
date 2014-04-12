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
    NSString *typeW = @"W";
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
    if ((create > 7 || empathy > 7 || assert > 7 || claim > 7)) {
        int count = 0;
        
        if (create < 6) {
            count = count + 1;
        }
        if (empathy < 6) {
            count = count + 1;
        }
        if (assert < 6) {
            count = count + 1;
        }
        if (claim < 6) {
            count = count + 1;
        }
        
        if (count > 6) {
            result = typeX;
            return result;
        }
    }
    
    // Type R
    if (empathy > 6 && assert > 6) {
        result = typeR;
        return result;
    }
    
    // Type O
    if (create > 6 && claim > 6) {
        result = typeO;
        return result;
    }
    
    // Type Y
    if (create > 3 && create < 7 &&
        assert > 3 && assert < 7 &&
        empathy > 3 && empathy < 7 &&
        claim > 3 && claim < 7) {
        result = typeY;
        return result;
    }
    
    // Type G
    if (create > 6 && empathy > 6) {
        result = typeG;
        return result;
    }
    
    // Type W
    if (claim > 6 && assert > 6) {
        result = typeW;
        return result;
    }
    
    // Type C
    if (create > 6 && assert > 6) {
        result = typeC;
        return result;
    }
    
    // Type E
    if (empathy > 6 && claim > 6) {
        result = typeE;
        return result;
    }
    
    return result;
}

@end
