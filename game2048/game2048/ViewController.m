//
//  ViewController.m
//  game2048
//
//  Created by Abhineet Sharma on 2/4/17.
//  Copyright © 2017 Abhineet Sharma. All rights reserved.
//

#import "ViewController.h"

NSMutableArray *dataArray,*dataLinearArray;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dataArray = [[NSMutableArray alloc] initWithCapacity: 4];
    
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"0",@"8",@"2",@"2",nil] atIndex:0];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"4",@"8",@"4",@"4",nil] atIndex:1];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"4",@"0",@"0",@"2",nil] atIndex:2];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"2",@"16",@"0",@"0",nil] atIndex:3];
    
    [self updateLabelWithMaster2DDataArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabelWithMaster2DDataArray
{
    
    self.title00.text = [dataArray[0][0] isEqualToString :@"0" ] ? nil: dataArray[0][0];
    self.title01.text = [dataArray[0][1] isEqualToString :@"0" ] ? nil: dataArray[0][1];
    self.title02.text = [dataArray[0][2] isEqualToString :@"0" ] ? nil: dataArray[0][2];
    self.title03.text = [dataArray[0][3] isEqualToString :@"0" ] ? nil: dataArray[0][3];
    
    self.title10.text = [dataArray[1][0] isEqualToString :@"0" ]  ? nil: dataArray[1][0];
    self.title11.text = [dataArray[1][1] isEqualToString :@"0" ]  ? nil: dataArray[1][1];
    self.title12.text = [dataArray[1][2] isEqualToString :@"0" ]  ? nil: dataArray[1][2];
    self.title13.text = [dataArray[1][3] isEqualToString :@"0" ]  ? nil: dataArray[1][3];
    
    self.title20.text = [dataArray[2][0] isEqualToString :@"0" ]  ? nil: dataArray[2][0];
    self.title21.text = [dataArray[2][1] isEqualToString :@"0" ]  ? nil: dataArray[2][1];
    self.title22.text = [dataArray[2][2] isEqualToString :@"0" ]  ? nil: dataArray[2][2];
    self.title23.text = [dataArray[2][3] isEqualToString :@"0" ]  ? nil: dataArray[2][3];
    
    self.title30.text = [dataArray[3][0] isEqualToString :@"0" ]  ? nil: dataArray[3][0];
    self.title31.text = [dataArray[3][1] isEqualToString :@"0" ]  ? nil: dataArray[3][1];
    self.title32.text = [dataArray[3][2] isEqualToString :@"0" ]  ? nil: dataArray[3][2];
    self.title33.text = [dataArray[3][3] isEqualToString :@"0" ]  ? nil: dataArray[3][3];
    
    [self updateDataLinearArrayWithDataArray];
    
    
}
-(void) updateDataLinearArrayWithDataArray
{
    dataLinearArray = [[NSMutableArray alloc]init];
    for(int i=0;i<dataArray.count;i++)
        for(int j =0 ;j<dataArray.count;j++)
            [dataLinearArray addObject:dataArray[i][j]];
    
}
-(NSMutableArray*) removeSpace:(NSMutableArray*) nsa
{
    
    NSMutableArray *ns = [[NSMutableArray alloc]init];
    
    for(NSString * str in nsa)
    {
        if(![str isEqualToString:@"0"])
        {
            [ns addObject:str];
        }
    }
    
    
    return ns;
    
    
}

@end
