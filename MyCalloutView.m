// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import "MyCalloutView.h"


@implementation MyCalloutView

@synthesize title = _title;
@synthesize monday, tuesday, wednesday, thursday, friday,saturday,sunday;

- (IBAction)closePopup:(id)sender {
}


    
       
 
    


- (IBAction)smallDone:(id)sender {
    [self  removeFromSuperview];
}


- (IBAction)cancelBank:(id)sender {
    
    [self  removeFromSuperview];
}

-(IBAction) handleTouch:(id)sender {
    NSLog(@"touch %@", sender);
}


- (id)initWithAnnotation:(CalloutAnnotation*)annotation {
    self = [super initWithAnnotation:annotation];
    
    
    NSString *title = [annotation.content.values objectForKey:@"branchId"];
    self.title.text = title;
    
    NSString *monday = [annotation.content.values objectForKey:@"monday"];
    if([monday isEqualToString:@""]){
        self.monday.text = @"N/A";
        
    }else{
        self.monday.text = monday;
    }
  
    NSString *tuesday = [annotation.content.values objectForKey:@"tuesday"];
    if([tuesday isEqualToString:@""]){
        self.tuesday.text = @"N/A";
        
    }else{
        self.tuesday.text = tuesday;
    }
   
    NSString *wednesday = [annotation.content.values objectForKey:@"wednesday"];
    
    
    if([wednesday isEqualToString:@""]){
        self.wednesday.text = @"N/A";
        
    }else{
        self.wednesday.text = wednesday;
    }
    NSString *thursday = [annotation.content.values objectForKey:@"thursday"];
    
    if([thursday isEqualToString:@""]){
        self.thursday.text = @"N/A";
        
    }else{
        self.thursday.text = thursday;
    }
    NSString *friday = [annotation.content.values objectForKey:@"friday"];
    if([friday isEqualToString:@""]){
        self.friday.text = @"N/A";
        
    }else{
        self.friday.text = friday;
    }
    
    NSString *saturday = [annotation.content.values objectForKey:@"saturday"];
    if([saturday isEqualToString:@""]){
        self.saturday.text = @"N/A";
        
    }else{
        self.saturday.text = saturday;
    }
    NSString *sunday = [annotation.content.values objectForKey:@"sunday"];
    if([sunday isEqualToString:@""]){
        self.sunday.text = @"N/A";
        
    }else{
        self.sunday.text = sunday;
    }
    
    return self;
}

- (IBAction)chooseBank:(id)sender {
    //start function
    NSString *notificationName = MAP_NOTIFIER_KEY;
    
    NSString *key = @"BranchId";
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:self.title.text forKey:key];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self.title.text userInfo:dictionary];
   
    [self  removeFromSuperview];
    
}

- (IBAction)smallChooseBranch:(id)sender {
    
    //start function
    NSString *notificationName = MAP_NOTIFIER_KEY;
    
    NSString *key = @"BranchId";
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:self.smallTitle.text forKey:key];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self.smallTitle.text userInfo:dictionary];
    
    [self  removeFromSuperview];
    
}


- (void)setAnnotation:(CalloutAnnotation *)annotation
{
    self.title.text = [annotation.content.values objectForKey:@"branchid"];
    self.address.text = [annotation.content.values objectForKey:@"address"];
    self.city.text = [[NSString stringWithFormat:@"%@ %@ %@", [annotation.content.values objectForKey:@"city"], [annotation.content.values objectForKey:@"prov"], [annotation.content.values objectForKey:@"postal"]]capitalizedString];;
    [super setAnnotation:annotation];
}



@end
