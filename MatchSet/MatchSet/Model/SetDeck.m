//
//  SetDeck.m
//  MatchSet
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "SetDeck.h"

@implementation SetDeck

-(instancetype)init{
    
    self=[super init];
    
    if(self){
        
        for(NSString *shape in [SetCard validShape]){
            
            for(UIColor *color in [SetCard validColors]){
                
                for(NSNumber *alpha in [SetCard validAlpha]){
                
                    for(NSNumber *repet  in [SetCard validRepet]){

                    SetCard *card=[[SetCard alloc]init];
                    card.shape=shape;
                    card.color=color;
                    card.alpha=alpha;
                    card.repet=repet;
                    [self addCard:card];
                    }
                }
            
            }
            
        }
    }
    
    return self;
}

@end
