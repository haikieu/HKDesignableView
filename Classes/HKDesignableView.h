//
//  HKDesignableView.h
//  DemoViewRender
//
//  Created by Hai Kieu on 10/21/15.
//  Copyright © 2015 Hai Kieu. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface HKDesignableView : UIView

@property(nonatomic,readonly)BOOL isInterfaceBuilderTarget;

@property (strong, nonatomic,readonly)UIView *contentView;


@end
