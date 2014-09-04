

#import "EEThirdTabViewController.h"

@interface EEThirdTabViewController () <UITableViewDelegate>

#pragma mark - IBActions
- (IBAction)mentalMathTapped:(id)sender;
- (IBAction)mathExplainedTapped:(id)sender;
- (IBAction)allTheMathTapped:(id)sender;
- (IBAction)essentialMathTapped:(id)sender;

@end

@implementation EEThirdTabViewController

#pragma mark - View Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Initial setup methods
    [self tabBarSetup];
}

#pragma mark - Initial setup methods
- (void)tabBarSetup
{
    //Set edges and content inset
    //Keeps tab bar from covering last table view cell
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.tableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, CGRectGetHeight(self.tabBarController.tabBar.frame), 0.0f);
}

#pragma mark - IBAction Methods

- (IBAction)mentalMathTapped:(id)sender
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.amazon.com/Secrets-Mental-Math-Mathemagicians-Calculation/dp/0307338401/"]];
}

- (IBAction)mathExplainedTapped:(id)sender
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.amazon.com/Math-Better-Explained-Unlock-Intuition/dp/1479186724/"]];
}

- (IBAction)allTheMathTapped:(id)sender
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.amazon.com/Math-Youll-Ever-Need-Self-Teaching/dp/0471317519/"]];
}

- (IBAction)essentialMathTapped:(id)sender
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.amazon.com/Mastering-Essential-Math-Skills-Minutes/dp/0966621123/"]];
}
@end
