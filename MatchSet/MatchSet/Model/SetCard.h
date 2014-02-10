//
//  SetCard.h
//  MatchSet
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property(strong,nonatomic) NSString *shape;
@property(strong,nonatomic) UIColor *color;
@property(strong,nonatomic) NSNumber *alpha;
@property(strong,nonatomic) NSNumber *repet;

-(NSAttributedString *)getAttributeContents;
+(NSArray *)validShape;
+(NSArray *)validColors;
+(NSArray *)validAlpha;
+(NSArray *)validRepet;

@end
