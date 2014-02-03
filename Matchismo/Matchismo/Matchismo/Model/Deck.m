//
//  Deck.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property(nonatomic,strong)NSMutableArray *cards;
@end

@implementation Deck

-(NSMutableArray *)cards{

    if(!_cards)_cards=[[NSMutableArray alloc] init];
    
    return _cards;
    
}


-(void) addCard:(Card *)card atTop:(BOOL) atTop{

    if(atTop){
        [self.cards setObject:card atIndexedSubscript:0];
    }else{
        [self.cards addObject:card];
    }
    
}
-(void) addCard:(Card *)card{

    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard{

    Card *randomCard=nil;
    
    if([self.cards count]){
    
        int ramdomIndex=arc4random() % [self.cards count];
        randomCard=[self.cards objectAtIndex:ramdomIndex];
        [self.cards removeObjectAtIndex:ramdomIndex];
    }
    
    
    return randomCard;
}
@end
