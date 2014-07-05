//
//  NEGType.m
//  Negotiation3
//
//  Created by chermann on 3/23/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGType.h"

@implementation NEGType

/*
 var types = [
 {
 id: "type1",
 label: "Relational Negotiators",
 create: 3.222857143,
 assert: 4.64,
 empathy: 5.382857143,
 claim: 2.754285714
 },
 {
 id: "type2",
 label: "Empathetic Value Creators",
 create: 4.861538462,
 assert: 2.77948718,
 empathy: 5.528205128,
 claim: 2.830769231
 },
 {
 id: "type3",
 label: "Outcome-Focused Negotiators",
 create: 4.756363636,
 assert: 3.403636364,
 empathy: 3.636363636,
 claim: 4.203636364
 },
 {
 id: "type4",
 label: "Assertive Value Claimers",
 create: 2.542857143,
 assert: 5.257142857,
 empathy: 3.657142857,
 claim: 4.542857143
 },
 {
 id: "type5",
 label: "Assertive Value Creators",
 create: 4.628571429,
 assert: 5.447619048,
 empathy: 3.085714286,
 claim: 2.838095238
 }
 ];
 */

-(NSMutableDictionary *)createType:(NSString *)typeId label:(NSString *)label create:(id)create assert:(id)assert empathy:(id)empathy claim:(id)claim {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:typeId forKey:@"typeId"];
    [dictionary setObject:label forKey:@"label"];
    [dictionary setObject:create forKey:@"create"];
    [dictionary setObject:assert forKey:@"assert"];
    [dictionary setObject:empathy forKey:@"empathy"];
    [dictionary setObject:claim forKey:@"claim"];

    return dictionary;
}

-(void)printObject:(NSMutableDictionary *)dict {
    NSLog([NSString stringWithFormat:@"type: %@ label: %@ create: %@ assert: %@ empathy: %@ claim: %@",
           [dict objectForKey:@"typeId"],
           [dict objectForKey:@"label"],
           [dict objectForKey:@"create"],
           [dict objectForKey:@"assert"],
           [dict objectForKey:@"empathy"],
           [dict objectForKey:@"claim"]]);
}

-(NSMutableDictionary *)nearest:(NSArray *)types create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim {
    /*
     var minDist = 100;
     var minType = null;
     var len = types.length;
     for (var i = 0; i < len; i++) {
     var t = types[i];
     var dist = distance(t);
     if (dist < minDist) {
     minDist = dist;
     minType = t;
     }
     };
     return minType;
     */
    
    NSNumber *minDist = [NSNumber numberWithDouble:100.0];
    NSMutableDictionary *minType;
    
    for (NSMutableDictionary *type in types) {
        NSNumber *distance = [self distance:type create:create assert:assert empathy:empathy claim:claim];
        NSLog(@"%@", distance);
        if ([distance doubleValue] < [minDist doubleValue]) {
            minDist = distance;
            minType = type;
        }
    }
    
    return minType;
    
    
    
}
-(NSMutableDictionary *)furthest:(NSArray *)types create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim {
    /*
     var maxDist = 0;
     var maxType = null;
     var len = types.length;
     for (var i = 0; i < len; i++) {
     var t = types[i];
     var dist = distance(t);
     if (dist > maxDist) {
     maxDist = dist;
     maxType = t;
     }
     };
     return maxType;
     */
    NSNumber *maxDist = [NSNumber numberWithDouble:0.0];
    NSMutableDictionary *maxType;
    
    for (NSMutableDictionary *type in types) {
        NSNumber *distance = [self distance:type create:create assert:assert empathy:empathy claim:claim];
        NSLog(@"%@", distance);
        if ([distance doubleValue] > [maxDist doubleValue]) {
            maxDist = distance;
            maxType = type;
        }
    }
    
    return maxType;
}


-(NSNumber *)distance:(NSMutableDictionary *)type create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim {
    /*
     var c1 = Math.pow((answers.create - type.create), 2);
     var c2 = Math.pow((answers.assert - type.assert), 2);
     var c3 = Math.pow((answers.empathy - type.empathy), 2);
     var c4 = Math.pow((answers.claim - type.claim), 2);
     
     var result = Math.sqrt(c1 + c2 + c3 + c4);
     
     return result;
     */
    
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
    
    NSMutableDictionary *type1 = [self createType:@"type1" label:@"Relational Negotiators" create:[NSNumber numberWithFloat:3.222857143] assert:[NSNumber numberWithFloat:4.64] empathy:[NSNumber numberWithFloat:5.382857143] claim:[NSNumber numberWithFloat:2.754285714]];

    NSMutableDictionary *type2 = [self createType:@"type2" label:@"Empathetic Value-Creators" create:[NSNumber numberWithFloat:4.861538462] assert:[NSNumber numberWithFloat:2.77948718] empathy:[NSNumber numberWithFloat:5.528205128] claim:[NSNumber numberWithFloat:2.830769231]];


    NSMutableDictionary *type3 = [self createType:@"type3" label:@"Outcome-Focused Negotiators" create:[NSNumber numberWithFloat:4.756363636] assert:[NSNumber numberWithFloat:3.403636364] empathy:[NSNumber numberWithFloat:3.636363636] claim:[NSNumber numberWithFloat:4.203636364]];
    

    NSMutableDictionary *type4 = [self createType:@"type4" label:@"Assertive Value-Claimers" create:[NSNumber numberWithFloat:2.542857143] assert:[NSNumber numberWithFloat:5.257142857] empathy:[NSNumber numberWithFloat:3.657142857] claim:[NSNumber numberWithFloat:4.542857143]];
    
    
    NSMutableDictionary *type5 = [self createType:@"type5" label:@"Assertive Value-Creators" create:[NSNumber numberWithFloat:4.628571429] assert:[NSNumber numberWithFloat:5.447619048] empathy:[NSNumber numberWithFloat:3.085714286] claim:[NSNumber numberWithFloat:2.838095238]];
    
    NSArray *types = [NSArray arrayWithObjects:type1, type2, type3, type4, type5, nil];
    
    NSMutableDictionary *furthest = [self furthest:types create:create assert:assert empathy:empathy claim:claim];
    NSMutableDictionary *nearest = [self nearest:types create:create assert:assert empathy:empathy claim:claim];
    
    //[self printObject:type1];
    //[self printObject:type2];
    //[self printObject:type3];
    //[self printObject:type4];
    //[self printObject:type5];
    
    NSLog(@"create: %i, assert:%i, empathy:%i, claim:%i", create, assert, empathy, claim);
    
    
    NSLog(@"Nearest");
    [self printObject:nearest];
    
    NSLog(@"Furthest");
    [self printObject:furthest];
    
    
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
