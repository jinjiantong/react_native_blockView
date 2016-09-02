//
//  BlockView.h
//  MURAL
//
//  Created by jinchunhao on 8/3/16.
//  Copyright © 2016 jinchunhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RCTView.h"

@class BlockView;

@interface BlockView : RCTView <UIGestureRecognizerDelegate>

@property (nonatomic) NSString * componentID;

@end
