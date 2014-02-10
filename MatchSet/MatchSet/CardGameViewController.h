//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Card.h"
#import "Deck.h"
@interface CardGameViewController : UIViewController


-(Deck *)createDeck;
@end
