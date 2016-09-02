//
//  BlockView.m
//  MURAL
//
//  Created by jinchunhao on 8/3/16.
//  Copyright © 2016 jinchunhao. All rights reserved.
//

#import "BlockView.h"

@implementation BlockView

@synthesize componentID = _componentID;

- (id)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {

  }
  return self;
}

- (void)setComponentID:(NSString *)componentID
{
  _componentID = componentID;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
  //里面逻辑只是参考 根据自己布局写
  //当动画view触发的时候 找底层scrollview 设置不滚动
  //如果是动画view
  if([_componentID isEqualToString:@"animationView"]){
     
      //先找拦截层
      UITouch *touch = [touches anyObject];
      UIView *touchView = touch.view;
      BOOL findBlockView = YES;
      UIView *currentSuperView = touchView;
      UIView *superBlockView;
      while (findBlockView) {
             currentSuperView = currentSuperView.superview;
              if([currentSuperView isKindOfClass:self.class]){
                  superBlockView = currentSuperView;
              }
        
            if([NSStringFromClass(currentSuperView.class) isEqualToString:@"XSYRootView"]){
               findBlockView = NO;
            }
      }
    
    if(superBlockView){
      
      UIView *view = superBlockView;
      BOOL isNotRootView = true;
      while (isNotRootView) {
        view =  view.superview;
        //在找底层滑动scrollview
        if([NSStringFromClass(view.class) isEqualToString:@"RCTCustomScrollView"])
        {
          // RCTXSYCustomScrollView *customScrollView = (RCTXSYCustomScrollView*)view;
          
          ((UIScrollView *)view).scrollEnabled = NO;
          isNotRootView = NO;
          
        }
        if([NSStringFromClass(view.class) isEqualToString:@"XSYRootView"]){
          isNotRootView = NO;
        }
        
      }
    }

  }
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
  
   [self _setContainScrollEnabled:[touches anyObject].view];
}

- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
  
  [self _setContainScrollEnabled:[touches anyObject].view];
}

- (void)_setContainScrollEnabled:(UIView *) currentView{
    
    //还原设置
    if([_componentID isEqualToString:@"animationView"]){
        
        //先找拦截层
        UITouch *touch = [touches anyObject];
        UIView *touchView = touch.view;
        BOOL findBlockView = YES;
        UIView *currentSuperView = touchView;
        UIView *superBlockView;
        while (findBlockView) {
            currentSuperView = currentSuperView.superview;
            if([currentSuperView isKindOfClass:self.class]){
                superBlockView = currentSuperView;
            }
            
            if([NSStringFromClass(currentSuperView.class) isEqualToString:@"XSYRootView"]){
                findBlockView = NO;
            }
        }
        
        if(superBlockView){
            
            UIView *view = superBlockView;
            BOOL isNotRootView = true;
            while (isNotRootView) {
                view =  view.superview;
                //在找底层滑动scrollview
                if([NSStringFromClass(view.class) isEqualToString:@"RCTCustomScrollView"])
                {
                    // RCTXSYCustomScrollView *customScrollView = (RCTXSYCustomScrollView*)view;
                    
                    ((UIScrollView *)view).scrollEnabled = YES;
                    isNotRootView = NO;
                    
                }
                if([NSStringFromClass(view.class) isEqualToString:@"XSYRootView"]){
                    isNotRootView = NO;
                }
                
            }
        }
        
    }
}

@end
