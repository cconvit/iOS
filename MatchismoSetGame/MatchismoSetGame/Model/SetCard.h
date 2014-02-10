//
//  SetCard.h
//  MatchismoSetGame
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property(strong,nonatomic) UIColor *color;
@property(strong,nonatomic) NSString *shape;
@property(strong,nonatomic) NSString *shading;

+(NSArray *)validColors;
+(NSArray *)validNumber;
+(NSArray *)validShading;
+(NSArray *)validShape;
@end

