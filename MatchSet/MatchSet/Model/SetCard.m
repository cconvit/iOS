//
//  SetCard.m
//  MatchSet
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


@synthesize shape=_shape;

-(int) match:(NSArray *)otherCards{
    int score=3;
    
    
    return score;
}

-(NSMutableAttributedString *)getAttributeContents{
    
    NSMutableString *cont=[[NSMutableString alloc] init];
    
    for(int x=0;x<[self.repet intValue];x++){
        
        cont = [[NSMutableString alloc] initWithString:[cont stringByAppendingFormat:@"%@ \n",self.shape]];
    }
    
    UIColor *transparent= [self.color colorWithAlphaComponent:[self.alpha floatValue]];
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:cont];
    [string addAttribute:NSForegroundColorAttributeName value:transparent range:NSMakeRange(0,cont.length)];
    [string addAttribute:NSStrokeWidthAttributeName value: @-5 range:NSMakeRange(0,cont.length)];
    [string addAttribute:NSStrokeColorAttributeName value: self.color range:NSMakeRange(0,cont.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont preferredFontForTextStyle:UIFontTextStyleBody] range:NSMakeRange(0,cont.length)];
    
   
    
    
  return string;
}
+(NSArray *)validShape{
    return @[@"◼︎",@"▲",@"●"];
}

+(NSArray *)validColors{
    return @[[UIColor redColor],[UIColor greenColor],[UIColor purpleColor]];
    
}

+(NSArray *)validRepet{
    return @[@1,@2,@3];
    
}

+(NSArray *)validAlpha{
    return @[@1,@0,@0.5];
    
}




-(NSString *)shape{
    
    return _shape ? _shape:@"?";
}
-(void)setShape:(NSString *)shape{
    
    if([[SetCard validShape] containsObject:shape] ){
        _shape=shape;
    }
    
}



@end
