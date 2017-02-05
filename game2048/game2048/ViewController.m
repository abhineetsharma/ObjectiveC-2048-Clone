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
    
   // self.lbl00.backgroundColor=[UIColor colorWithPatternImage:newImage];
    //[[self lbl00 ] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"2.png"]]];
    [self setImage:dataArray[0][0] forLabel:self.lbl00];
    [self setImage:dataArray[0][1] forLabel:self.lbl01];
    [self setImage:dataArray[0][2] forLabel:self.lbl02];
    [self setImage:dataArray[0][3] forLabel:self.lbl03];
    
    [self setImage:dataArray[1][0] forLabel:self.lbl10];
    [self setImage:dataArray[1][1] forLabel:self.lbl11];
    [self setImage:dataArray[1][2] forLabel:self.lbl12];
    [self setImage:dataArray[1][3] forLabel:self.lbl13];
    
    [self setImage:dataArray[2][0] forLabel:self.lbl20];
    [self setImage:dataArray[2][1] forLabel:self.lbl21];
    [self setImage:dataArray[2][2] forLabel:self.lbl22];
    [self setImage:dataArray[2][3] forLabel:self.lbl23];
    
    [self setImage:dataArray[3][0] forLabel:self.lbl30];
    [self setImage:dataArray[3][1] forLabel:self.lbl31];
    [self setImage:dataArray[3][2] forLabel:self.lbl32];
    [self setImage:dataArray[3][3] forLabel:self.lbl33];
    /* self.lbl01.text = [dataArray[0][1] isEqualToString :@"0" ] ? nil: dataArray[0][1];
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
    self.lbl33.text = [dataArray[3][3] isEqualToString :@"0" ]  ? nil: dataArray[3][3];*/
    
    [self updateDataLinearArrayWithDataArray];
    
    
}
-(void) updateDataLinearArrayWithDataArray
{
    dataLinearArray = [[NSMutableArray alloc]init];
    for(int i=0;i<dataArray.count;i++)
        for(int j =0 ;j<dataArray.count;j++)
            [dataLinearArray addObject:dataArray[i][j]];
    
}
-(void) setImage:(NSString*)str forLabel:(UILabel*)lbl
{
    int num = (int)[str integerValue];
    lbl.text = nil;
    
    if(num<2048)
    {
        NSString * imageName=[NSString stringWithFormat:@"%i.jpg",num];
    
        UIImage *img = [UIImage imageNamed:imageName];
        CGSize imgSize = lbl.frame.size;
    
        UIGraphicsBeginImageContext( imgSize );
        [img drawInRect:CGRectMake(0,0,imgSize.width,imgSize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        lbl.backgroundColor =  [UIColor colorWithPatternImage:newImage];
    }
    else
    {
        lbl.text =  str;
        lbl.backgroundColor = [UIColor colorWithRed:(241/255.0) green:(133/255.0) blue:(0/255.0) alpha:1] ;
        
    }
}

@end
