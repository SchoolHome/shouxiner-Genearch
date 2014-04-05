
#import <Foundation/Foundation.h>


@interface PetProgressView : UIView {
@private
    float _progress;
    float _progressStartAngle;
}

/**
 * progress (0.0 到 1.0)
 */
@property (nonatomic, assign) float progress;
@property (nonatomic, assign) float progressStartAngle;

-(void)resetProgress;

@end