//
//  ViewController.m
//  game2048
//
//  Created by Abhineet Sharma on 2/5/17.
//  Copyright © 2017 Abhineet Sharma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSMutableArray *dataArray,*dataLinearArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self updateLabelWithMaster2DDataArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabelWithMaster2DDataArray
{
    
    //self.lbl00.text = [dataArray[0][0] isEqualToString :@"0" ] ? nil: dataArray[0][0];
    [[self lbl00 ] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"/tile/2.jpg"]]];
    self.lbl01.text = [dataArray[0][1] isEqualToString :@"0" ] ? nil: dataArray[0][1];
    self.lbl02.text = [dataArray[0][2] isEqualToString :@"0" ] ? nil: dataArray[0][2];
    self.lbl03.text = [dataArray[0][3] isEqualToString :@"0" ] ? nil: dataArray[0][3];
    
    self.lbl10.text = [dataArray[1][0] isEqualToString :@"0" ]  ? nil: dataArray[1][0];
    self.lbl11.text = [dataArray[1][1] isEqualToString :@"0" ]  ? nil: dataArray[1][1];
    self.lbl12.text = [dataArray[1][2] isEqualToString :@"0" ]  ? nil: dataArray[1][2];
    self.lbl13.text = [dataArray[1][3] isEqualToString :@"0" ]  ? nil: dataArray[1][3];
    
    self.lbl20.text = [dataArray[2][0] isEqualToString :@"0" ]  ? nil: dataArray[2][0];
    self.lbl21.text = [dataArray[2][1] isEqualToString :@"0" ]  ? nil: dataArray[2][1];
    self.lbl22.text = [dataArray[2][2] isEqualToString :@"0" ]  ? nil: dataArray[2][2];
    self.lbl23.text = [dataArray[2][3] isEqualToString :@"0" ]  ? nil: dataArray[2][3];
    
    self.lbl30.text = [dataArray[3][0] isEqualToString :@"0" ]  ? nil: dataArray[3][0];
    self.lbl31.text = [dataArray[3][1] isEqualToString :@"0" ]  ? nil: dataArray[3][1];
    self.lbl32.text = [dataArray[3][2] isEqualToString :@"0" ]  ? nil: dataArray[3][2];
    self.lbl33.text = [dataArray[3][3] isEqualToString :@"0" ]  ? nil: dataArray[3][3];
    
    [self updateDataLinearArrayWithDataArray];
    
    
}
-(void) updateDataLinearArrayWithDataArray
{
    dataLinearArray = [[NSMutableArray alloc]init];
    for(int i=0;i<dataArray.count;i++)
        for(int j =0 ;j<dataArray.count;j++)
            [dataLinearArray addObject:dataArray[i][j]];
    
}
-(UIColor*) getImage:(int)num
{
    NSString * imageName;
    
    switch(num)
    {
        case 2:
            imageName = [NSString stringWithFormat:@"/tile/%i.jpg",2];
            break;
        case 4:break;
        case 8:break;
        case 16:break;
        case 32:break;
        case 64:break;
        case 128:break;
        case 256:break;
        case 512:break;
        case 1024:break;
        case 2048:break;
    }
    return [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
}

@end
