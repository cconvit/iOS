//
//  SetCardDeck.m
//  MatchismoSetGame
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck



-(instancetype)init{
    
    self=[super init];
    
    if(self){
        
        for(UIColor *color in [SetCard validColors]){
            
            for(NSNumber *number in [SetCard validNumber]){
                
                for(NSString *shape in [SetCard validShape]){
                    
                    for(NSString *shading in [SetCard validShading]){
                        
                        SetCard *card=[[SetCard alloc]init];
                        card.color=color;
                        card.number=number;
                        card.shape=shape;
                        card.shading=shading;
                        
                        [self addCard:card];

                        
                    }
                    
                }
                
                
            }
            
            
        }
    }
    
    return self;
}

@end
