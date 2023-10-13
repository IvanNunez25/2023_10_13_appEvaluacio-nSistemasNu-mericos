//
//  ViewController.h
//  2023_10_13_appEvaluaciónSistemasNúmericos
//
//  Created by Ivanovicx Nuñez on 13/10/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

/* Text Field */
@property (weak, nonatomic) IBOutlet UITextField *textoNumero;
- (IBAction)textoEditado:(UITextField *)sender;

/* Label */
@property (weak, nonatomic) IBOutlet UILabel *textoResultado;

/* Picker View */
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewSisNum;

/* Arrays */
@property (strong, nonatomic) NSArray *expresionesReg;

@end

