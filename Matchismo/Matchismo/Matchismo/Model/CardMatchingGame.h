//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
@property(nonatomic,readonly)NSInteger score;

@end
