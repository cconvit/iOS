//
//  Card.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "Card.h"

@implementation Card


-(int) match:(NSArray *) otherCard{

    int score=0;
    
    for(Card *card in otherCard){
    
        if([card.contents isEqualToString:self.contents]){
            score=1;
        }
    }
    
    return score;
}

-(NSAttributedString *)getAttributeContents{

    return nil;
}
@end
