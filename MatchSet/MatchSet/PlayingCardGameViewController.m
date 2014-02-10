//
//  PlayingCardGameViewController.m
//  MatchSet
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController


-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

@end
