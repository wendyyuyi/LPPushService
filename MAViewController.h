//
//  MAViewController.h
//  hw_1
//
//  Created by 余宜臻 on 2017/1/21.
//  Copyright © 2017年 余宜臻. All rights reserved.
//


#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]



#import <UIKit/UIKit.h>
#import "MAViewController.h"
#import "MAThermometer.h"

@interface MAViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *viewForThermometer1;
@property (weak, nonatomic) IBOutlet UIView *viewForThermometer2;
@property (weak, nonatomic) IBOutlet UIView *viewForThermometer3;
@property (weak, nonatomic) IBOutlet UIView *viewForThermometer4;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *labelSlider;
@property (weak, nonatomic) IBOutlet UILabel *thermolabel;




@property (weak, nonatomic) IBOutlet MAThermometer *thermometerWithoutShadow;
@property (weak, nonatomic) IBOutlet MAThermometer *thermometerWithShadow;


@end
