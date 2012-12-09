
// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import "CalloutView.h"
#import "CalloutAnnotation.h"

@interface MyCalloutView : CalloutView

@property (nonatomic, retain) IBOutlet UILabel* title;
@property (strong, nonatomic) IBOutlet UIButton *chooseBankButton;


- (IBAction) handleTouch:(id)sender;
- (id) initWithAnnotation:(CalloutAnnotation*)annotation;
- (IBAction)chooseBank:(id)sender;
- (void)Register_Notification:(NSString*)branch;
@end
