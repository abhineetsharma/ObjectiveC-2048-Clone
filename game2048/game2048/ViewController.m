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
UIFont *newFont ;
NSMutableArray *dataArray,*dataLinearArray;
int score;
NSString *hScore;
bool soundFlag;
- (void)viewDidLoad {
   [super viewDidLoad];
    UIFont *currentFont = self.lbl00.font;
    
    newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:24];
    soundFlag = YES;
   
    [self initializeGame];
    hScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"highScore"];
    self.lblHighScore.text = hScore;
    NSLog(@"%@", hScore);
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
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
-(void) initializeGame
{
    score = 0;
    dataArray = [[NSMutableArray alloc] initWithCapacity: 4];
    
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",nil] atIndex:0];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",nil] atIndex:1];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",nil] atIndex:2];
    [dataArray insertObject:[NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",nil] atIndex:3];
    
    
    
    [self updateLabelWithMaster2DDataArray];
    for(int i=0;i<2;i++)
    {
        [self addElement];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchToggle:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        NSLog(@"its on!");
        soundFlag = YES;
    } else {
        NSLog(@"its off!");
        soundFlag = NO;
    }

}


-(void)updateLabelWithMaster2DDataArray
{
    
   
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
    if(soundFlag)
        [self playSound];
    
    self.lblScore.text = [NSString stringWithFormat:@"%i",score];
    int highScoreInt = [hScore intValue];
    if(score>highScoreInt){
        hScore = [NSString stringWithFormat:@"%i",score];
        
        [[NSUserDefaults standardUserDefaults] setObject:hScore forKey:@"highScore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.lblHighScore.text = hScore;
        
    }
    [self updateDataLinearArrayWithDataArray];
    [self checkIfFinished];
    
    
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
bool alertShown=NO;
-(void) setImage:(NSString*)str forLabel:(UILabel*)lbl
{
    //str=@"4096";
    int num = (int)[str integerValue];
    
    //lbl.text=@"";
    
    if(num<2048)
    {
        
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
        if(!alertShown){
        UIAlertController * alertController =[UIAlertController alertControllerWithTitle:@"You won" message:@"Congratulation on making 2048 tile" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        dispatch_async(dispatch_get_main_queue(),^{[self presentViewController:alertController animated:YES completion:nil];});
            alertShown=YES;
        }
   
        lbl.text =  str;
        lbl.textColor = [UIColor whiteColor];
        lbl.backgroundColor = [UIColor colorWithRed:(241/255.0) green:(133/255.0) blue:(0/255.0) alpha:1] ;
        
        
    }
}
-(void) addElement
{
    
    NSMutableArray * nsArr = [[NSMutableArray alloc]init];
    int i=0;
    for(NSString* str in dataLinearArray)
    {
        if([str isEqualToString:@"0"])
        {
            [nsArr addObject:[NSNumber numberWithInt:i]];
        }
        i++;
    }
    
    if(nsArr.count>0)
    {
        int num = arc4random_uniform((int)nsArr.count-1);
        int ran = (int)[nsArr[num] integerValue];
        dataLinearArray[ran] = [NSString stringWithFormat:@"%i",[self randomNo:1]];
        [self updateDataArrayWithDataLinearArray];
    }
    
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
            num = arc4random_uniform(21);
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
    
    for(NSString * str in nsa)
    {
        if(![str isEqualToString:@"0"])
        {
            [ns addObject:str];
        }
    }
    
    
    
    return ns;
    
    
}

-(void)checkIfFinished
{
    bool matchflag1 = NO, matchflag2 = NO;
    for(int i=0;i<dataArray.count;i++)
    {
        for(int j=0;j<dataArray.count-1;j++)
        {
            NSString * ns1 = dataArray[i][j];
            NSString * ns2 = dataArray[i][j+1];
            
            if([ns1 isEqualToString:@"0"] ||[ns2 isEqualToString:@"0"] ||[ns1 isEqualToString:ns2])
            {
                matchflag1=YES;
                break;
            }
            
            NSString * ns3 = dataArray[j][i];
            NSString * ns4 = dataArray[j+1][i];
            
            if([ns3 isEqualToString:@"0"] ||[ns4 isEqualToString:@"0"] ||[ns3 isEqualToString:ns4])
            {
                matchflag2=YES;
                break;
            }
        }
        
    }
    if(!matchflag1 && !matchflag2)
    {
        UIAlertController * alertController =[UIAlertController alertControllerWithTitle:@"Game finished" message:@"You loose" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Reset" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {[self initializeGame];}];
        [alertController addAction:ok];
        
        dispatch_async(dispatch_get_main_queue(),^{[self presentViewController:alertController animated:YES completion:nil];});
        alertShown=YES;
    }
}


- (IBAction)resetPressed:(id)sender {
    UIAlertController * alertController =[UIAlertController alertControllerWithTitle:@"Want to reset the game" message:@"All progress will get lost" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * reset = [UIAlertAction actionWithTitle:@"Reset" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {[self initializeGame];}];
    
     UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:reset];
    [alertController addAction:cancel];

    
    dispatch_async(dispatch_get_main_queue(),^{[self presentViewController:alertController animated:YES completion:nil];});
    alertShown=YES;
    [self initializeGame];
}


//swipe Right
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
                score+=n;
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
    [self addElement];
    
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
                score+=n;
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
    [self addElement];
    
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
    //[self updateLabelWithMaster2DDataArray];
    
    for(int j=0;j<count;j++)
    {
        for(int i = 0;i<count-1;i++)
        {
            NSString* na1 = dataArray[i][j];
            NSString* na2 = dataArray[i+1][j];
            
            if(![na1 isEqualToString:@"0"] && ![na2 isEqualToString:@"0"])
            {
                if([na1 isEqualToString:na2])
                {
                    dataArray[i][j] = [NSString stringWithFormat:@"%i",[na1 intValue]*2];
                    score +=[dataArray[i][j] intValue];
                    if(i+2<count)
                    {
                        for(int k=i+1;k<count-1;k++)
                            dataArray[k][j]= dataArray[k+1][j];
                        dataArray[count-1][j]=@"0";
                    }else
                        dataArray[i+1][j]=@"0";
                }
            }
            
        }
    }
    [self updateLabelWithMaster2DDataArray];
    [self addElement];
    
    
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
                score+=n;
                if(i-2>-1)
                {
                    for(int k=i-1; k>0;k--)
                    {
                        if(k-1>-1){
                            dataArray[k][j] = dataArray[k-1][j];
                            dataArray[k-1][j]=@"0";
                        }
                        
                    }
                }
                else
                    dataArray[i-1][j]=@"0";

            }
        }
        
    }
    //NSLog(@"%@",dataArray);
    [self updateLabelWithMaster2DDataArray];
    [self addElement];
    
}


@end
