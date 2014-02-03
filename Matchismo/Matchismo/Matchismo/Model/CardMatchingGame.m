//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(nonatomic,readwrite)NSInteger score;
@property(nonatomic,strong)NSMutableArray *cards;//of card
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{

    if(!_cards)_cards=[[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{

    self=[super init];
    
    if(self){
    
        
    }
    
    return self;

}

-(instancetype)init{

    return nil;
}
@end
