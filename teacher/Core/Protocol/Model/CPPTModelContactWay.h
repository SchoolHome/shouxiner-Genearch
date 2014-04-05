#import <Foundation/Foundation.h>


/**
 * 联系方式
 */

@interface CPPTModelContactWay : NSObject
{
#if 0
    NSNumber *contactWayID_;    //主键
    NSNumber *contactID_;       //联系人主键
    NSNumber *regType_;         //注册类型 1 已注册
    NSNumber *type_;            //联系方式的类型
    NSString *name_;            //联系方式类型的描述
    NSString *value_;           //联系方式的值
#endif
    
    NSString *phoneNum_;    //Not Null!
    NSString *phoneArea_;
}

#if 0
@property (strong,nonatomic) NSNumber *contactWayID;
@property (strong,nonatomic) NSNumber *contactID;
@property (strong,nonatomic) NSNumber *regType;
@property (strong,nonatomic) NSNumber *type;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *value;
#endif

@property (strong, nonatomic) NSString *phoneNum;
@property (strong, nonatomic) NSString *phoneArea;

+ (CPPTModelContactWay *)fromJsonDict:(NSDictionary *)jsonDict;

- (NSMutableDictionary *)toJsonDict;

@end
