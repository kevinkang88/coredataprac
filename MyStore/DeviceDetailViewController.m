//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by dong yoon kang on 8/4/15.
//  Copyright (c) 2015 yoon kevin kang. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "CoreData/CoreData.h"

@interface DeviceDetailViewController ()
@property (strong, nonatomic) IBOutlet UITextField *deviceName;
@property (strong, nonatomic) IBOutlet UITextField *deviceVersion;
@property (strong, nonatomic) IBOutlet UITextField *deviceCompany;

@end

@implementation DeviceDetailViewController


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveDevice:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    [newDevice setValue:self.deviceName.text forKey:@"name"];
    [newDevice setValue:self.deviceVersion.text forKey:@"version"];
    [newDevice setValue:self.deviceCompany.text forKey:@"company"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
