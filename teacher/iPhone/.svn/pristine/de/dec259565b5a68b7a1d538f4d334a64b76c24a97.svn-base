

#import "PetProgressView.h"
#import "PetView.h"
@implementation PetProgressView

#pragma mark -
#pragma mark Accessors

- (float)progress {
    return _progress;
}

- (void)setProgress:(float)progress {
    _progress = progress;
    [self setNeedsDisplay];
}

-(float)progressStartAngle{
    return  _progressStartAngle;
}

-(void)setProgressStartAngle:(float)startAngle{
    _progressStartAngle = startAngle;
    [self setNeedsDisplay];
}

#pragma mark -
#pragma mark Lifecycle

//562/2

- (id)init {
    return [self initWithFrame:CGRectMake(0.0f, 0.0f, (562/4.0)*2, (562/4.0)*2)];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pet_bigcircle"]];
		self.opaque = NO;
        self.alpha = 0.6;
    }
    return self;
}

-(void)resetProgress{
    [self setProgress:0.0f];
}

#pragma mark -
#pragma mark Drawing

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGRect allRect = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3.0f);
    CGFloat lineWidth = 2.0f;
    
    CGPoint center = CGPointMake(allRect.size.width / 2, allRect.size.height / 2);
    CGFloat radius = allRect.size.width / 2;
    CGFloat startAngle = self.progressStartAngle;//kAngle4+M_PI/13.0f;//- ((float)M_PI / 2); // 90 degrees
    CGFloat endAngle = (1.0 * 2 * (float)M_PI) + startAngle;
    //CGContextSetRGBFillColor(context, 0.0f, 0.0f, 0.0f, 0.6);
    //CGContextFillEllipseInRect(context, CGRectMake(2, 2, (radius-lineWidth)*2, (radius-lineWidth)*2));

    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1.0);
    CGContextStrokeEllipseInRect(context, CGRectMake(6, 6, (radius-lineWidth-4)*2, (radius-lineWidth-4)*2));
    
    endAngle = (self.progress * 2 * (float)M_PI) + startAngle;
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextAddArc(context, center.x, center.y, radius-lineWidth-4, startAngle, endAngle, 0);
    CGContextStrokePath(context);
}

@end
