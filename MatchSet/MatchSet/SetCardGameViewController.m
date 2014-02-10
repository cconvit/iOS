//
//  SetCardGameViewController.m
//  MatchSet
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetDeck.h"
@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

-(Deck *)createDeck{
    return [[SetDeck alloc] init];
}

@end
