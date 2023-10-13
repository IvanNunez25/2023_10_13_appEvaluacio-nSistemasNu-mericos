//
//  ViewController.m
//  2023_10_13_appEvaluaciónSistemasNúmericos
//
//  Created by Ivanovicx Nuñez on 13/10/23.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *nombresSistemas;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _expresionesReg = [[NSArray alloc] initWithObjects:@"^[0-9A-Fa-f]+$", @"^[0-1]+$", @"^[0-9]+$", @"^[0-7]+$", nil];
    
    nombresSistemas = @[@"Hexadecimal", @"Binario", @"Decimal", @"Octal"];
    
    self.pickerViewSisNum.dataSource = self;
    _pickerViewSisNum.delegate = self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_expresionesReg count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [nombresSistemas objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *texto = _textoNumero.text;
    
    if([texto length]){
        NSString *mensaje = [[NSString alloc] init];
        NSError *error = nil;
        NSRegularExpression *expReg = [[NSRegularExpression alloc] initWithPattern:[_expresionesReg objectAtIndex:row] options:0 error:&error];
        
        long numMatches = [expReg numberOfMatchesInString:texto options:0 range:NSMakeRange(0, [texto length])];
        
        if(numMatches)
            mensaje = @"Número válido";
        else
            mensaje = @"Número NO válido";
        
        _textoResultado.text = mensaje;
    } else {
        _textoResultado.text = @"";
    }
    
}

- (IBAction)textoEditado:(UITextField *)sender {
    [self pickerView:_pickerViewSisNum didSelectRow:[_pickerViewSisNum selectedRowInComponent:0] inComponent:0];
}
@end
