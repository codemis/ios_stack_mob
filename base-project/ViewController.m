#import "ViewController.h"
#import "ListViewController.h"
#import "AppDelegate.h"
#import "StackMob.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFieldInput;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end

@implementation ViewController

@synthesize managedObjectContext = _managedObjectContext;

- (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.managedObjectContext = [[self.appDelegate coreDataStore] contextForCurrentThread];
    self.textFieldInput.delegate = self;
}

- (void)viewDidUnload
{
    [self setTextFieldInput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ListViewController *listVC = segue.destinationViewController;
    listVC.todoTitle = self.textFieldInput.text;
}
@end
