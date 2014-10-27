//
//  NEGType.m
//  Negotiation3
//
//  Created by chermann on 3/23/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGType.h"

@implementation NEGType


-(NSMutableDictionary *)createType:(NSString *)typeId label:(NSString *)label create:(id)create assert:(id)assert empathy:(id)empathy claim:(id)claim string1:string1 string2:string2 {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:typeId forKey:@"typeId"];
    [dictionary setObject:label forKey:@"label"];
    [dictionary setObject:create forKey:@"create"];
    [dictionary setObject:assert forKey:@"assert"];
    [dictionary setObject:empathy forKey:@"empathy"];
    [dictionary setObject:claim forKey:@"claim"];
    [dictionary setObject:string1 forKey:@"string1"];
    [dictionary setObject:string2 forKey:@"string2"];

    return dictionary;
}

-(NSMutableDictionary *)nearest:(NSArray *)types create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim {

    NSNumber *minDist = [NSNumber numberWithDouble:100.0];
    NSMutableDictionary *minType;
    
    for (NSMutableDictionary *type in types) {
        NSNumber *distance = [self distance:type create:create assert:assert empathy:empathy claim:claim];
        
        if ([distance doubleValue] < [minDist doubleValue]) {
            minDist = distance;
            minType = type;
        }
    }
    
    return minType;
    
    
    
}
-(NSMutableDictionary *)furthest:(NSArray *)types create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim {

    NSNumber *maxDist = [NSNumber numberWithDouble:0.0];
    NSMutableDictionary *maxType;
    
    for (NSMutableDictionary *type in types) {
        NSNumber *distance = [self distance:type create:create assert:assert empathy:empathy claim:claim];
        
        if ([distance doubleValue] > [maxDist doubleValue]) {
            maxDist = distance;
            maxType = type;
        }
    }
    
    return maxType;
}


-(NSNumber *)distance:(NSMutableDictionary *)type create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim {

    NSNumber *typeCreate = (NSNumber *) [type objectForKey:@"create"];
    NSNumber *typeAssert = (NSNumber *)[type objectForKey:@"assert"];
    NSNumber *typeEmpathy = (NSNumber *)[type objectForKey:@"empathy"];
    NSNumber *typeClaim = (NSNumber *)[type objectForKey:@"claim"];
    

    
    double c1 = pow((create - [typeCreate doubleValue]), 2);
    double c2 = pow((assert - [typeAssert doubleValue]), 2);
    double c3 = pow((empathy - [typeEmpathy doubleValue]), 2);
    double c4 = pow((claim - [typeClaim doubleValue]), 2);
    
    double result = sqrt((c1 + c2 + c3 + c4));
    
    return [NSNumber numberWithDouble:result];
}

-(NSMutableDictionary *)getType:(id)detailItem {
    
    int create = (int)[[detailItem valueForKey:@"question1"] doubleValue];
    int assert = (int)[[detailItem valueForKey:@"question2"] doubleValue];
    int empathy = (int)[[detailItem valueForKey:@"question3"] doubleValue];
    int claim = (int)[[detailItem valueForKey:@"question4"] doubleValue];
    
    NSMutableDictionary *type1 = [self createType:@"type1"
                                            label:@"Relational Negotiator"
                                           create:[NSNumber numberWithFloat:3.222857143]
                                           assert:[NSNumber numberWithFloat:4.64]
                                          empathy:[NSNumber numberWithFloat:5.382857143]
                                            claim:[NSNumber numberWithFloat:2.754285714]
                                          string1:@"You are more confident about your interpersonal skills (self-advocacy and empathy) than most people are. But you are less sure about how well you do in regard to creating value and claiming your share of it."
                                          string2:@"In theory, your interpersonal skills should produce good negotiation success. You may not be giving yourself enough credit in that regard.  In any case, when you review the skill-building tips in this app, start with the sections on creating value and maximizing your share."];

    NSMutableDictionary *type2 = [self createType:@"type2"
                                            label:@"Empathetic Value-Creator"
                                           create:[NSNumber numberWithFloat:4.861538462]
                                           assert:[NSNumber numberWithFloat:2.77948718]
                                          empathy:[NSNumber numberWithFloat:5.528205128]
                                            claim:[NSNumber numberWithFloat:2.830769231]
                                          string1:@"Your relative confidence about understanding other parties’ motivations and feelings is coupled with confidence about finding value-creating solutions."
                                          string2:@"Understanding other people’s interests is important to negotiation success. So is self-advocacy. It’s great to expand the pie, but you need to get your fair share of it, as well. When you review the skill-building tips in this app, start with the section on asserting your own interests."];

    NSMutableDictionary *type3 = [self createType:@"type3"
                                            label:@"Outcome-Focused Negotiator"
                                           create:[NSNumber numberWithFloat:4.756363636]
                                           assert:[NSNumber numberWithFloat:3.403636364]
                                          empathy:[NSNumber numberWithFloat:3.636363636]
                                            claim:[NSNumber numberWithFloat:4.203636364]
                                          string1:@"You have greater confidence than most people about your create value in negotiation and claiming your share of it. (Remember that these group comparisons are relative: on average respondents only give themselves a “3” on maximizing value.)<br><br>Correspondingly, you are less sure than most people about how doing well in regard to self-advocacy and empathy."
                                          string2:@"Even if most of your negotiations are done by phone, email, or Skype, good relational skills can make the difference between a satisfactory agreement and impasse. When you review the skill-building tips in this app, start with the interpersonal factors to further enhance your effectiveness on this important dimension."];
    
    NSMutableDictionary *type4 = [self createType:@"type4"
                                            label:@"Assertive Value-Claimer"
                                           create:[NSNumber numberWithFloat:2.542857143]
                                           assert:[NSNumber numberWithFloat:5.257142857]
                                          empathy:[NSNumber numberWithFloat:3.657142857]
                                            claim:[NSNumber numberWithFloat:4.542857143]
                                          string1:@"You have above average confidence in asserting your interests and maximizing your slice of the pie."
                                          string2:@"Self-advocacy is important to negotiation success, but so is understanding the interests and feelings of other parties. That knowledge is essential to making creative trades; expanding the pie can ultimately produce even more gain for you. When you review the skill-building tips in this app, start with the section on understanding other peoples’ interests."];
    
    NSMutableDictionary *type5 = [self createType:@"type5"
                                            label:@"Assertive Value-Creator"
                                           create:[NSNumber numberWithFloat:4.628571429]
                                           assert:[NSNumber numberWithFloat:5.447619048]
                                          empathy:[NSNumber numberWithFloat:3.085714286]
                                            claim:[NSNumber numberWithFloat:2.838095238]
                                          string1:@"You have above average confidence in asserting your interests, but are less sure about maximizing your own value in deal."
                                          string2:@"At first glance, this may seem paradoxical: effective self-advocacy should produce a good outcome. You actually may be doing better than you think. Perhaps you set goals that are hard to meet. In any case, when you review the skill-building tips in this app, start with the section on maximizing your share."];
    
    NSArray *types = [NSArray arrayWithObjects:type1, type2, type3, type4, type5, nil];
    
    NSMutableDictionary *furthest = [self furthest:types create:create assert:assert empathy:empathy claim:claim];
    NSMutableDictionary *nearest = [self nearest:types create:create assert:assert empathy:empathy claim:claim];
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    [result setObject:nearest forKey:@"nearest"];
    [result setObject:furthest forKey:@"furthest"];
    [result setObject:[NSNumber numberWithInt:create] forKey:@"create"];
    [result setObject:[NSNumber numberWithInt:assert] forKey:@"assert"];
    [result setObject:[NSNumber numberWithInt:empathy] forKey:@"empathy"];
    [result setObject:[NSNumber numberWithInt:claim] forKey:@"claim"];

    return result;
    
}

@end
