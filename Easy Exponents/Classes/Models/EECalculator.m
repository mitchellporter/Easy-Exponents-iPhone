

#import "EECalculator.h"

@interface EECalculator ()

@property (readwrite) CGFloat firstPower;
@property (readwrite) CGFloat secondPower;
@property (readwrite) CGFloat thirdPower;
@property (readwrite) CGFloat fourthPower;
@property (readwrite) CGFloat fifthPower;
@property (readwrite) CGFloat sixthPower;
@property (readwrite) CGFloat seventhPower;
@property (readwrite) CGFloat eighthPower;
@property (readwrite) CGFloat ninthPower;
@property (readwrite) CGFloat tenthPower;

@end

@implementation EECalculator

#pragma mark - Calculator Methods
- (void)calculateValuesForNumber:(CGFloat)number
{
    //Call all 4 calculation methods and set calculated properties
    self.firstPower = [EECalculator calculateFirstPowerWithNumber:number];
    self.secondPower = [EECalculator calculateSecondPowerWithNumber:number];
    self.thirdPower = [EECalculator calculateThirdPowerWithNumber:number];
    self.fourthPower = [EECalculator calculateFourthPowerWithNumber:number];
    self.fifthPower = [EECalculator calculateFifthPowerWithNumber:number];
    self.sixthPower = [EECalculator calculateSixthPowerWithNumber:number];
    self.seventhPower = [EECalculator calculateSeventhPowerWithNumber:number];
    self.eighthPower = [EECalculator calculateEighthPowerWithNumber:number];
    self.ninthPower = [EECalculator calculateNinthPowerWithNumber:number];
    self.tenthPower = [EECalculator calculateTenthPowerWithNumber:number];
}

+ (CGFloat)calculateFirstPowerWithNumber:(CGFloat)number
{
    return number;
}

+ (CGFloat)calculateSecondPowerWithNumber:(CGFloat)number
{
    return number * number;
}

+ (CGFloat)calculateThirdPowerWithNumber:(CGFloat)number
{
    return number * number * number;
}

+ (CGFloat)calculateFourthPowerWithNumber:(CGFloat)number
{
    return number * number * number * number;
}

+ (CGFloat)calculateFifthPowerWithNumber:(CGFloat)number
{
    return number * number * number * number * number;
}

+ (CGFloat)calculateSixthPowerWithNumber:(CGFloat)number
{
    return number * number * number * number * number * number;
}

+ (CGFloat)calculateSeventhPowerWithNumber:(CGFloat)number
{
    return number * number * number * number * number * number * number;
}

+ (CGFloat)calculateEighthPowerWithNumber:(CGFloat)number
{
    return number * number * number * number * number * number * number * number;
}

+ (CGFloat)calculateNinthPowerWithNumber:(CGFloat)number
{
    return number * number * number * number * number * number * number * number * number;
}

+ (CGFloat)calculateTenthPowerWithNumber:(CGFloat)number
{
    return number * number * number * number * number * number * number * number * number * number;
}

@end
