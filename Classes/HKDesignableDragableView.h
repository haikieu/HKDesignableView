//
//  HKDesignableDragableView.h
//  DemoViewRender
//
//  Created by Hai Kieu on 10/21/15.
//  Copyright © 2015 Hai Kieu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKDesignableView.h"

@interface HKDesignableDragableView : HKDesignableView

@property(nonatomic,weak)IBOutlet UIView * containerView;
@property(nonatomic,assign)IBInspectable BOOL dragable;

@end
