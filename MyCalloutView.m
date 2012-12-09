// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import "MyCalloutView.h"


@implementation MyCalloutView

@synthesize title = _title;


-(IBAction) handleTouch:(id)sender {
    NSLog(@"touch %@", sender);
}


- (id)initWithAnnotation:(CalloutAnnotation*)annotation {
    self = [super initWithAnnotation:annotation];
    self.title.text = [annotation.content.values objectForKey:@"title"];
    
    //set all the other stuff here
    return self;
}

- (void)setAnnotation:(CalloutAnnotation *)annotation
{
    self.title.text = [annotation.content.values objectForKey:@"title"];
    [super setAnnotation:annotation];
}

#pragma mark - NSObject



@end
