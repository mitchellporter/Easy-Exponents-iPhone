

#import "EEFirstTabViewController.h"
#import "EECalculator.h"
#import "SAMGradientView.h"

@interface EEFirstTabViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

#pragma mark - Properties
@property (strong, nonatomic) IBOutlet UITextField *monthlyRevenueTextField;
@property (strong, nonatomic) IBOutlet UITableView *calculatedValuesTableView;
@property (strong, nonatomic) IBOutlet UITableView *exponentTableView;
@property (nonatomic) EECalculator *calculator;

@end

@implementation EEFirstTabViewController

#pragma mark - View Methods
- (void)viewDidLoad
{
    [super viewDidLoad];

    //Create calculator and set delegate
    self.calculator = [[EECalculator alloc]init];
    
    //Perform all custom setup methods
    [self gradientBackgroundViewSetup];
    [self tabBarTintColorSetup];
    [self keyboardGestureSetup];
    [self customKeyboardSetup];
}

#pragma mark - Initial Setup Methods

- (void)customKeyboardSetup
{
    UIToolbar *keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(doneClicked:)];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor blackColor],NSForegroundColorAttributeName,
                                nil];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes
                                                forState:UIControlStateNormal];
    
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    self.monthlyRevenueTextField.inputAccessoryView = keyboardDoneButtonView;
}

- (void)keyboardGestureSetup
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(hideKeyboard)];
    
    [self.view addGestureRecognizer:tapGesture];
}

- (void)gradientBackgroundViewSetup
{
    //Create gradient view
    SAMGradientView *gradientView = [[SAMGradientView alloc] init];
    
    if([UIScreen mainScreen].bounds.size.height == 568) {
        
        gradientView.frame = CGRectMake(0, 0, 320, 568);
        
    } else {
        
        gradientView.frame = CGRectMake(0, 0, 320, 640);
        
    }
	gradientView.gradientColors = @[
                                    [UIColor colorWithRed:0.149 green:0.243 blue:0.494 alpha:1],
                                    [UIColor colorWithRed:0.275 green:0.369 blue:0.620 alpha:1]
                                    ];
    gradientView.gradientMode = SAMGradientViewModeLinear;
    //Add gradient view to view hierarchy
	[self.view insertSubview:gradientView atIndex:0];
    
    //Set the table view's background to clear
    self.calculatedValuesTableView.backgroundColor = [UIColor clearColor];
}

- (void)tabBarTintColorSetup
{
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.149 green:0.243 blue:0.494 alpha:1];
}

#pragma mark - Keyboard Methods
- (void)hideKeyboard
{
    [self.monthlyRevenueTextField resignFirstResponder];
}

- (IBAction)doneClicked:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark - Text Field Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.monthlyRevenueTextField) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    CGFloat number = [textField.text floatValue];
    
    //Calculate values and reload table view to reflect new values
    [self.calculator calculateValuesForNumber:number];
    [self.calculatedValuesTableView reloadData];

}

#pragma mark - Table View Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Create cell and static identifier
    static NSString *cellIdentifier = @"SettingsCell";
    UITableViewCell  *cell = [self.calculatedValuesTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    switch (indexPath.row) {
        case 0:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the first power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.firstPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 1:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the second power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.secondPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 2:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the third power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.thirdPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 3:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the fourth power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.fourthPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 4:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the fifth power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.fifthPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 5:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the sixth power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.sixthPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 6:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the seventh power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.seventhPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 7:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the eighth power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.eighthPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 8:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the ninth power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.ninthPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        case 9:
            
            cell.textLabel.text = [NSString stringWithFormat:@"%.0f to the tenth power is:", [self.monthlyRevenueTextField.text floatValue]];;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f", self.calculator.tenthPower];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
            
        default:
            return cell;
    }
    
}


@end
