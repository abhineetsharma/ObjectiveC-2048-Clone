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
    dataArray = [[NSMutableArray alloc] initWithCapacity: 4];
    
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"0",@"8",@"2",@"2",nil] atIndex:0];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"4",@"8",@"4",@"4",nil] atIndex:1];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"4",@"0",@"0",@"2",nil] atIndex:2];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"2",@"16",@"0",@"0",nil] atIndex:3];
 

    [self updateLabelWithMaster2DDataArray];
    //left Swipe
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    //right Swipe
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    //up Swipe
    UISwipeGestureRecognizer * swipeup=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeup:)];
    swipeup.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeup];
    
    //down Swipe
    UISwipeGestureRecognizer * swipedown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedown:)];
    swipedown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipedown];

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
    [self playSound];
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
-(void) updateDataArrayWithDataLinearArray
{
    NSMutableArray *arr =[[NSMutableArray alloc]init];
    dataArray = [[NSMutableArray alloc] initWithCapacity: 4];
    for(int i=0;i<dataLinearArray.count+1;i++)
    {
        
        if(i==0 || i%4!=0)
        {
            
        }
        else{
            
            [dataArray addObject:arr];
            arr = [[NSMutableArray alloc]init];
        }
        if(dataLinearArray.count>i)
            [arr addObject:dataLinearArray[i]];
        
    }
    [self updateLabelWithMaster2DDataArray];
    
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
    //str=@"4096";
    int num = (int)[str integerValue];
    
    lbl.text=@"";
    
    if(num<2048)
    {
        UIFont *currentFont = lbl.font;
        UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:currentFont.pointSize];
        lbl.font = newFont;
        lbl.text =  ![str isEqualToString:@"0"]?str:@" ";
        lbl.textColor = [UIColor whiteColor];
        NSString * imageName=[NSString stringWithFormat:@"%i.jpg",num];
    
        UIImage *img = [UIImage imageNamed:imageName ];
        CGSize imgSize = lbl.frame.size;
    
        UIGraphicsBeginImageContext( imgSize );
        [img drawInRect:CGRectMake(0,0,imgSize.width,imgSize.height) ];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        CATransition *animation = [CATransition animation];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.type = kCATransitionFade;
        animation.duration = 0.5;
        [lbl.layer addAnimation:animation forKey:@"kCATransitionFade"];
        lbl.backgroundColor =  [UIColor colorWithPatternImage:newImage];
    }
    else
    {
        lbl.text =  str;
        lbl.textColor = [UIColor whiteColor];
        lbl.backgroundColor = [UIColor colorWithRed:(241/255.0) green:(133/255.0) blue:(0/255.0) alpha:1] ;
        
        
    }
}
-(void) addElement
{
    for(int i=0;i<[self randomNo:1]/2;i++)
    {
        int ran = [self randomNo:2];
        if([dataLinearArray[ran] isEqualToString: @"0"])
            dataLinearArray[ran] = [NSString stringWithFormat:@"%i",[self randomNo:1]];
    }
    
    [self updateDataArrayWithDataLinearArray];
    
}
//play sound
-(void) playSound
{
    NSString * rSound = [NSString stringWithFormat:@"%i",[self randomNo:3]];
    
    NSString * soundPath = [[NSBundle mainBundle]
                            pathForResource:rSound ofType:@"wav"];
    NSURL * sound1 =  [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)sound1, &theSound);
    
    AudioServicesPlaySystemSound(theSound);
}
-(int) randomNo:(int) choice
{
    int num=0;
    switch (choice) {
        case 1:{
            int r = arc4random() % 2;
            
            if(r == 0)
                num = 2;
            else
                num = 4;
        }
            break;
        case 2:
        {
            num = arc4random() % 16;
            break;
            
        }
        case 3:
        {
            num = arc4random_uniform(22);
            num++;
            break;
        
        }
            
        default:
            break;
    }
    
    return num;
    
}
-(NSMutableArray*) removeSpace:(NSMutableArray*) nsa
{
    
    NSMutableArray *ns = [[NSMutableArray alloc]init];
    //NSMutableArray *ns1 = [[NSMutableArray alloc]init];
    
    for(NSString * str in nsa)
    {
        if(![str isEqualToString:@"0"])
        {
            [ns addObject:str];
        }
    }
    /*
     NSMutableArray * rns = [[ns reverseObjectEnumerator] mutableCopy];
    
    for(int i=0;i<rns.count-1;i++)
    {
        NSString* na1 = rns[i];
        NSString* na2 = rns[i+1];
        if(![na1 isEqualToString:@"0"] && ![na2 isEqualToString:@"0"] && [na1 isEqualToString: na2 ])
        {
            int n = (int)[na1 integerValue];
            rns[i] = [NSString stringWithFormat:@"%i", n*2];
            rns[i+1]= rns[i+2];
        }
    }
    for(NSString * str in rns)
    {
        if(![str isEqualToString:@"0"])
        {
            [ns1 addObject:str];
        }
    }*/
    
    
    
    return ns;
    
    
}
-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    int count = (int)dataArray.count;
    // NSLog(@"%@",dataArray);
    NSMutableArray * mns = [[NSMutableArray alloc]init];
    for(NSMutableArray * n in dataArray)
    {
        NSMutableArray * m = [[NSMutableArray alloc]init];
        m = [[[n reverseObjectEnumerator] allObjects]mutableCopy];
        [mns addObject:[self removeSpace:m]];
        
    }
    
    // NSLog(@"mns %@",mns);
    int j =0;
    for(NSMutableArray *na in mns)
    {
        int i =count-1 ;
        for(NSString * ns in na)
        {
            
            //NSString * msg = [NSString stringWithFormat:@"%i %i %@",count-1-i,j,ns];
            dataArray[j][i] = ns;
            i--;
            
        }
        
        int naCount =(int) na.count;
        
        if(count-naCount>0)
        {
            for(int l=0;l<count-naCount;l++)
            {
                dataArray[j][l] = @"0";
                //NSString * msg = [NSString stringWithFormat:@"%i %i %@",l,j,@"0"];
                
                
            }
        }
        
        j++;
    }
    [self updateLabelWithMaster2DDataArray];
    
    for(int j=0;j<count;j++)
    {
        for(int i =count-1;i>0;i--)
        {
            //NSString * msg = [NSString stringWithFormat:@"%@ %@",na[i],na[i-1]];
            //NSLog(msg);
            NSString* na1 = dataArray[j][i];
            NSString* na2 = dataArray[j][i-1];
            
            if(![na1 isEqualToString:@"0"] && ![na2 isEqualToString:@"0"] && [na1 isEqualToString: na2 ])
            {
                int n = (int)[na1 integerValue]*2;
                dataArray[j][i] = [NSString stringWithFormat:@"%i",n];
                
                if(i-2>=0)
                {
                    int h=1;
                    for(int k=i-1; k>0;k--)
                    {
                        
                        dataArray[j][k] = dataArray[j][k-1];
                        h=k-1;
                        
                    }
                    if(h==0)
                    {
                        dataArray[j][h]= @"0";
                    }
                    
                }
                else
                    dataArray[j][i-1]=@"0";
            }
        }
        
    }
    //NSLog(@"%@",dataArray);
    [self updateLabelWithMaster2DDataArray];
    //[self addElement];
    
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    int count = (int)dataArray.count;
    // NSLog(@"%@",dataArray);
    NSMutableArray * mns = [[NSMutableArray alloc]init];
    for(NSMutableArray * n in dataArray)
    {
        [mns addObject:[self removeSpace:n]];
        
    }
    
    // NSLog(@"mns %@",mns);
    int j =0;
    for(NSMutableArray *na in mns)
    {
        int i =0 ;
        for(NSString * ns in na)
        {
            
            //NSString * msg = [NSString stringWithFormat:@"%i %i %@",count-1-i,j,ns];
            dataArray[j][i] = ns;
            i++;
            
        }
        
        int naCount =(int) na.count;
        
        if(count-naCount>0)
        {
            for(int l=naCount;l<count;l++)
            {
                dataArray[j][l] = @"0";
                //NSString * msg = [NSString stringWithFormat:@"%i %i %@",l,j,@"0"];
                
                
            }
        }
        
        j++;
    }
    [self updateLabelWithMaster2DDataArray];
    for(int j=0;j<count;j++)
    {
        for(int i =0;i<count-1;i++)
        {
            //NSString * msg = [NSString stringWithFormat:@"%@ %@",na[i],na[i-1]];
            //NSLog(msg);
            NSString* na1 = dataArray[j][i];
            NSString* na2 = dataArray[j][i+1];
            
            if(![na1 isEqualToString:@"0"] && ![na2 isEqualToString:@"0"] && [na1 isEqualToString: na2 ])
            {
                int n = (int)[na1 integerValue]*2;
                dataArray[j][i] = [NSString stringWithFormat:@"%i",n];
                
                if(i+2<count)
                {
                    int h=1;
                    for(int k=i+1; k<count-1;k++)
                    {
                        
                        dataArray[j][k] = dataArray[j][k+1];
                        h=k+1;
                        
                    }
                    if(h==count-1)
                    {
                        dataArray[j][h]= @"0";
                    }
                    
                }
                else
                    dataArray[j][i+1]=@"0";
            }
        }
        
    }
    //NSLog(@"%@",dataArray);
    [self updateLabelWithMaster2DDataArray];
    // [self addElement];
    
}
//Swipe Up function
-(void)swipeup:(UISwipeGestureRecognizer*)gestureRecognizer{
    int count = (int)dataArray.count;
    
    // NSLog(@"%@",dataArray);
    NSMutableArray * mns = [[NSMutableArray alloc]init];
    for(int j = 0 ;j<count;j++){
        NSMutableArray * ns = [[NSMutableArray alloc]init];
        for(int i=0;i<count;i++)
        {
            [ns addObject:dataArray[i][j]];
        }
        [mns addObject:[self removeSpace:ns]];
        
    }
    // NSLog(@"mns %@",mns);
    int j =0;
    for(NSMutableArray *na in mns)
    {
        int i =0 ;
        for(NSString * ns in na)
        {
            
            //NSString * msg = [NSString stringWithFormat:@"%i %i %@",count-1-i,j,ns];
            dataArray[i][j] = ns;
            i++;
            
        }
        
        int naCount =(int) na.count;
        
        if(count-naCount>0)
        {
            for(int l=0;l<count-naCount;l++)
            {
                dataArray[count-l-1][j] = @"0";
                //NSString * msg = [NSString stringWithFormat:@"%i %i %@",l,j,@"0"];
                
                
            }
        }
        
        j++;
    }
    [self updateLabelWithMaster2DDataArray];
    
    for(int j=0;j<count;j++)
    {
        for(int i =0;i<count-2;i++)
        {
            //NSString * msg = [NSString stringWithFormat:@"%@ %@",na[i],na[i-1]];
            //NSLog(msg);
            NSString* na1 = dataArray[i][j];
            NSString* na2 = dataArray[i+1][j];
            
            if(![na1 isEqualToString:@"0"] && ![na2 isEqualToString:@"0"] && [na1 isEqualToString: na2 ])
            {
                int n = (int)[na1 integerValue]*2;
                dataArray[i][j] = [NSString stringWithFormat:@"%i",n];
                
                
                if(i+2<count)
                {
                    for(int k=i+1; k<count;k++)
                    {
                        if(k+1<count)
                            dataArray[k][j] = dataArray[k+1][j];
                        
                    }
                }
                else
                    dataArray[i+1][j]=@"0";
            }
        }
        
    }
    //NSLog(@"%@",dataArray);
    [self updateLabelWithMaster2DDataArray];
    //[self addElement];
    
    
}
//Swipe Down
-(void)swipedown:(UISwipeGestureRecognizer*)gestureRecognizer{
    int count = (int)dataArray.count;
    
    // NSLog(@"%@",dataArray);
    NSMutableArray * mns = [[NSMutableArray alloc]init];
    for(int j = 0 ;j<count;j++){
        NSMutableArray * ns = [[NSMutableArray alloc]init];
        for(int i=0;i<count;i++)
        {
            [ns addObject:dataArray[count-1-i][j]];
        }
        [mns addObject:[self removeSpace:ns]];
        
    }
    // NSLog(@"mns %@",mns);
    int j =0;
    for(NSMutableArray *na in mns)
    {
        int i =0 ;
        for(NSString * ns in na)
        {
            //NSString * msg = [NSString stringWithFormat:@"%i %i %@",count-1-i,j,ns];
            dataArray[count -1 -i][j] = ns;
            
            i++;
        }
        
        int naCount =(int) na.count;
        i=0;
        if(count-naCount>0)
        {
            for(int l=0;l<count-naCount;l++)
            {
                dataArray[l][j] = @"0";
                //NSString * msg = [NSString stringWithFormat:@"%i %i %@",l,j,@"0"];
                
                
            }
        }
        
        j++;
    }
    [self updateLabelWithMaster2DDataArray];
    
    for(int j=0;j<count;j++)
    {
        for(int i =count-1;i>0;i--)
        {
            //NSString * msg = [NSString stringWithFormat:@"%@ %@",na[i],na[i-1]];
            //NSLog(msg);
            NSString* na1 = dataArray[i][j];
            NSString* na2 = dataArray[i-1][j];
            
            if(![na1 isEqualToString:@"0"] && ![na2 isEqualToString:@"0"] && [na1 isEqualToString: na2 ])
            {
                int n = (int)[na1 integerValue]*2;
                dataArray[i][j] = [NSString stringWithFormat:@"%i",n];
                
                if(i-2>-1)
                    dataArray[i-1][j]=dataArray[i-2][j];
                else
                    dataArray[i-1][j]=@"0";
            }
        }
        
    }
    //NSLog(@"%@",dataArray);
    [self updateLabelWithMaster2DDataArray];
    //[self addElement];
    
}


@end
