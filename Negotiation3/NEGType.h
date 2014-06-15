//
//  NEGType.h
//  Negotiation3
//
//  Created by chermann on 3/23/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEGType : NSObject

-(NSString *)getType:(id)detailItem;

-(NSMutableDictionary *)createType:(NSString *)typeId label:(NSString *)label create:(id)create assert:(id)assert empathy:(id)empathy claim:(id)claim;

-(void)printObject:(NSMutableDictionary *)dict;

-(NSMutableDictionary *)nearest:(NSArray *)types create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim;
-(NSMutableDictionary *)furthest:(NSArray *)types create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim;
-(NSNumber *)distance:(NSMutableDictionary *)type create:(int)create assert:(int)assert empathy:(int)empathy claim:(int)claim;
@end
