//
//  MAViewController.m
//  hw_1
//
//  Created by 余宜臻 on 2017/1/21.
//  Copyright © 2017年 余宜臻. All rights reserved.
//

#import "MAViewController.h"
#import "MAThermometer.h"

@interface MAViewController ()
@property (nonatomic, strong) MAThermometer * thermometer1;
@property (nonatomic, strong) MAThermometer * thermometer2;
@property (nonatomic, strong) MAThermometer * thermometer3;
@property (nonatomic, strong) MAThermometer * thermometer4;

@end

@implementation MAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _thermometer1 = [[MAThermometer alloc] initWithFrame:_viewForThermometer1.bounds];
    [_thermometer1 setMaxValue:200];
    
    _thermometer2 = [[MAThermometer alloc] initWithFrame:_viewForThermometer2.bounds];

    _thermometer3 = [[MAThermometer alloc] initWithFrame:_viewForThermometer3.bounds];
    
    _thermometer4 = [[MAThermometer alloc] initWithFrame:_viewForThermometer4.bounds];
    
    [_thermometer3 setDarkTheme:YES];
    [_thermometer3 setArrayColors:@[[UIColor whiteColor], [UIColor lightGrayColor], [UIColor orangeColor],[UIColor purpleColor]]];
    
    [_thermometerWithShadow setGlassEffect:YES];
    
    [_viewForThermometer1 addSubview:_thermometer1];
    [_viewForThermometer2 addSubview:_thermometer2];
    [_viewForThermometer3 addSubview:_thermometer3];
    [_viewForThermometer4 addSubview:_thermometer4];
    
    
    [_labelSlider setText:[NSString stringWithFormat:@"%.2f", _slider.value]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(id)sender {

    [_labelSlider setText:[NSString stringWithFormat:@"%.2f", _slider.value]];
    _thermometer1.curValue = self.slider.value;
    _thermometer2.curValue = self.slider.value;
    _thermometer3.curValue = self.slider.value;
    _thermometer4.curValue = self.slider.value;
    _thermometerWithoutShadow.curValue = self.slider.value;
    _thermometerWithShadow.curValue = self.slider.value;
    
    if(self.slider.value <25){ _thermolabel.text = @"冷"; }
    else if(self.slider.value >=25 && self.slider.value <50){ _thermolabel.text = @"普通"; }
     else if(self.slider.value >=50 && self.slider.value <75){ _thermolabel.text = @"中火"; }
     else if(self.slider.value >=75 && self.slider.value <100){ _thermolabel.text = @"超火"; }
    

    
    NSLog(@"slider value    %2f", self.slider.value);

}
- (IBAction)return_btn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
   
}


@end
