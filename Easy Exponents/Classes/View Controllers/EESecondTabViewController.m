

#import "EESecondTabViewController.h"
#import "EEChecklistManager.h"
#import "SAMGradientView.h"
#import "MCSwipeTableViewCell.h"

@interface EESecondTabViewController () <MCSwipeTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource>

#pragma mark - Properties
@property (nonatomic) EEChecklistManager *checklistManager;

@end

@implementation EESecondTabViewController

#pragma mark - View Methods
- (void)viewDidLoad
{
    [super viewDidLoad];

    //Set delegate and datasource
    [self setDelegateAndDataSource];
    
    //Create checklist manager and customize table view appearance
    [self createChecklistManager];
    
    //Setup gradient background
    [self gradientBackgroundViewSetup];
}

#pragma mark - Initial Setup Methods
- (void)setDelegateAndDataSource
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)createChecklistManager
{
    self.checklistManager = [EEChecklistManager sharedMMChecklistManager];
    
    //Make sure the manager's swipedCellRows property exists
    if (!self.checklistManager.swipedCellIdNumbers) {
        self.checklistManager.swipedCellIdNumbers = [[NSMutableArray alloc]init];
        
    }
}

- (void)statusBarScrollingWorkaround
{
    //Create view with same size as status bar
    //Set view's background color to white
    //Add the view into the view hierarchy
    SAMGradientView *gradientView = [[SAMGradientView alloc] init];
    gradientView.frame = CGRectMake(0, 0, 320, 20);
    
	gradientView.gradientColors = @[//These are both the same colors and are used
                                    //to create the solid blue mock status bar
                                    [UIColor colorWithRed:0.149 green:0.243 blue:0.494 alpha:1],
                                    [UIColor colorWithRed:0.149 green:0.243 blue:0.494 alpha:1]
                                    ];
    
    //UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    //myView.backgroundColor = [UIColor whiteColor];
    [self.navigationController.view addSubview:gradientView];
}

- (void)gradientBackgroundViewSetup
{
    //Create gradient view
    SAMGradientView *gradientView = [[SAMGradientView alloc] init];
    gradientView.frame = CGRectMake(0, 0, 320, 700);
	gradientView.gradientColors = @[
                                    [UIColor colorWithRed:0.149 green:0.243 blue:0.494 alpha:1],
                                    [UIColor colorWithRed:0.275 green:0.369 blue:0.620 alpha:1]
                                    ];
    //Add gradient view to view hierarchy
	//[self.view insertSubview:gradientView atIndex:0];
    [self.navigationController.view insertSubview:gradientView atIndex:0];

    
    //Set the table view's background to clear
    self.tableView.backgroundColor = [UIColor clearColor];
}

#pragma mark - Table View Methods
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
    //Create cell and set delegate
    MCSwipeTableViewCell *cell = [[MCSwipeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    cell.delegate = self;
    cell.cellIdNumber = [NSNumber numberWithInteger:indexPath.row];
    
        //Remove inset of iOS 7 separators.
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        
        //Setting the background color of the cell.
        cell.contentView.backgroundColor = [UIColor colorWithRed:0.161 green:0.255 blue:0.506 alpha:1];
    
    
    //Set different color for swiped / completed cells
    if ([self.checklistManager.swipedCellIdNumbers containsObject:cell.cellIdNumber]) {
                
        cell.contentView.backgroundColor = [UIColor colorWithRed:1.000 green:0.310 blue:0.000 alpha:1];
        cell.backgroundColor = [UIColor colorWithRed:1.000 green:0.310 blue:0.000 alpha:1];
    }

    // Configuring the views and colors.
    UIView *checkView = [self viewWithImageName:@"check"];
    UIColor *greenColor = [UIColor colorWithRed:85.0 / 255.0 green:213.0 / 255.0 blue:80.0 / 255.0 alpha:1.0];
    
    
    //Setting the default inactive state color to the tableView background color.
    [cell setDefaultColor:[UIColor grayColor]];
    
    //Set the cell text based on the index path's row property
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Square roots";
            break;
        case 1:
            cell.textLabel.text = @"Cube roots";
            break;
        case 2:
            cell.textLabel.text = @"Ratios and Proportions";
            break;
        case 3:
            cell.textLabel.text = @"Percents";
            break;
        case 4:
            cell.textLabel.text = @"Measurements";
            break;
        case 5:
            cell.textLabel.text = @"Geometry";
            break;
        case 6:
            cell.textLabel.text = @"Coordinate graphs";
            break;
        case 7:
            cell.textLabel.text = @"Linear functions";
            break;
        case 8:
            cell.textLabel.text = @"Scientific notation";
            break;
        case 9:
            cell.textLabel.text = @"Absolute value";
            break;
        case 10:
            cell.textLabel.text = @"Radical expressions";
            break;
            
        default:
            break;
    }
    //cell.textLabel.text = @"This is a checklist item.";
    cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:17.0f];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    //Adding gestures per state basis.
    [cell setSwipeGestureWithView:checkView color:greenColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
      
        //Add swiped row to swiped rows array
        [self.checklistManager.swipedCellIdNumbers addObject:cell.cellIdNumber];
        
        [self.tableView reloadData];
    }];
    
    return cell;
}

#pragma mark - Swipe Cell Image Method
- (UIView *)viewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    return imageView;
}
    
@end
