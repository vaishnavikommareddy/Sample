//
//  ViewController.m
//  sample
//
//  Created by Valuelabs on 31/07/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "ViewController.h"
#import "NSString+stringWithURLEncoding.h"


@interface ViewController ()

@end

@implementation ViewController
//@synthesize receivedData;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self redirectNSLogToDocumentFolder];

    NSLog(@"Sample Application");
//    NSURLRequest *theRequest =
//    [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://loyaltyacc.gfkdaphne.com/jsonp.php?DOMAIN=LOYALTY_ACC"]
//                     cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//                 timeoutInterval:10.0];
    NSMutableString *mRequestStr;
//    mRequestStr = [NSString stringWithFormat:@"http://loyaltyacc.gfkdaphne.com/jsonp.php?DOMAIN=LOYALTY_ACC"];
     mRequestStr = [NSMutableString stringWithString:@"https://loyaltyacc.gfkdaphne.com/jsonp.php?DOMAIN=LOYALTY_ACC"];
    [mRequestStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
   /* mRequestStr = [NSMutableString stringWithString:@"https://loyaltyacc.gfkdaphne.com/jsonp.php?DOMAIN=LOYALTY_ACC&json={%22jsonrpc%22%3A%222.0%22%2C%22method%22%3A%22updateCells%22%2C%22params%22%3A{%22variables%22%3A{%22ALERT_STATUS%22%3A1}%2C%22FilterString%22%3A%22%28%28R%3A%3AID%3D710784%29%29%22}%2C%22id%22%3A%22setAlertStatus%22}"];*/
    
    
   /* NSArray *keys = [NSArray arrayWithObjects:@"ALERT_STATUS", @"FilterString", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"1",@"((R::ID = 710784))", nil];
    NSDictionary *var = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    NSArray *keys1 = [NSArray arrayWithObjects:@"variables", @"id", nil];
    NSArray *objects1 = [NSArray arrayWithObjects:var,@"setAlertStatus", nil];
    NSDictionary *param = [NSDictionary dictionaryWithObjects:objects1 forKeys:keys1];
    NSArray *keys2 = [NSArray arrayWithObjects:@"jsonrpc",@"method", @"params", nil];
    NSArray *objects2 = [NSArray arrayWithObjects:@"2.0",@"updateCells",param, nil];
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjects:objects2 forKeys:keys2];
    NSLog(@"jsonDict==%@",jsonDict);
    
    NSString *queryString = [self queryString:jsonDict];
    
    
    
     [mRequestStr appendFormat:@"&json=%@", queryString];*/
    
    
    
    

   // mRequestStr = [mRequestStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *theRequest =
    [NSMutableURLRequest requestWithURL:[NSURL URLWithString:mRequestStr]
                     cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                 timeoutInterval:60.0];
//    [theRequest setValue:@"Basic dmFsdWVsYWJzOnQzc3QxMjM=" forHTTPHeaderField:@"Authorization"];
    [theRequest setValue:@"Basic bWFyY28udm9zc2VuQGdmay5jb206KlVSV1ReaWRLaCUzNHEz" forHTTPHeaderField:@"Authorization"];
    //[theRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
   // [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
//    NSString *data = [NSString stringWithFormat:@"json={\"jsonrpc\":\"2.0\",\"method\":\"updateCells\",\"params\":{\"variables\":{\"ALERT_STATUS\":1}, \"FilterString\":\"((R::ID = 710784))\"},\"id\":\"setAlertStatus\"}"];

    [theRequest setValue:@"json" forHTTPHeaderField:@"Format"];
   /*  NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[data length]];
    [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];*/
	[theRequest setHTTPMethod:@"POST"];
    
    
    /* NSString *data = [NSString stringWithFormat:@"%@{\"jsonrpc\":\"2.0\",\"method\":\"getComments\",\"params\":{\"context\":\"PORTAL_COMMENT\",\"contextId\":710784},\"id\":\"comment\"}",@"&json="];*/
   
    NSString *data = [NSString stringWithFormat:@"%@{\"jsonrpc\":\"2.0\",\"method\":\"updateCells\",\"params\":{\"variables\":{\"ALERT_STATUS\":2},\"FilterString\":\"((R::ID=710784))\"},\"id\":\"setAlertStatus\"}",@"&json="];
   /* NSMutableString *data = [NSMutableString stringWithString:@"&json={%22jsonrpc%22%3A%222.0%22%2C%22method%22%3A%22updateCells%22%2C%22params%22%3A{%22variables%22%3A{%22ALERT_STATUS%22%3A1}%2C++%22FilterString%22%3A%22%28%28R%3A%3AID+%3D+710784%29%29%22}%2C%22id%22%3A%22setAlertStatus%22}"];*/
//     NSString *data = [NSString stringWithFormat:@"{\"jsonrpc\":\"2.0\",\"method\":\"updateCells\",\"params\":{\"variables\":{\"ALERT_STATUS\":1},\"FilterString\":\"((R::ID=710784))\"},\"id\":\"setAlertStatus\"}"];
   // data = [data stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *charactersToEscape = @"!*' {}();=:@+$,/?%#[]\" ^";
//    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
//    data = [data stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
//    data = [@"&json=" stringByAppendingFormat:@"%@",data];
//
     [theRequest setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
     [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    /*NSData *requestData = [NSData dataWithBytes:[data UTF8String] length:[data length]];
    [theRequest setHTTPBody:requestData];*/
    // create the connection with the request
    
    // and start loading the data
    // note that the delegate for the NSURLConnection is self, so delegate methods must be defined in this file
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
      NSLog(@"Request body %@", [[NSString alloc] initWithData:[theRequest HTTPBody] encoding:NSUTF8StringEncoding]);
    
      NSLog(@"allHTTPHeaderFields==%@", [theRequest allHTTPHeaderFields]);
    
       NSLog(@" theRequest=%@", theRequest);

    
    if (theConnection) {
        
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        
        receivedData = [NSMutableData data] ;
        
    } else {
        
        // Inform the user that the connection failed.
        
		UIAlertView *connectFailMessage = [[UIAlertView alloc] initWithTitle:@"NSURLConnection " message:@"Failed in viewDidLoad"  delegate: self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
		[connectFailMessage show];
    }
//    NSLog(@"merging---");
//
//    NSLog(@"pull the changes");
    }


- (NSString *)queryString :(NSDictionary*)jsonDict{
    NSMutableString *queryString = [NSMutableString string];
    
    for (NSString *name in jsonDict)
    {
        
        if ([name isKindOfClass:[NSDictionary class]]) {
            NSString *value = [self queryString:(NSDictionary*)name];
            NSLog(@"value==%@",value);
        } else {
            NSString *value = [jsonDict objectForKey:name];
           NSString *delimiter = ([queryString length] > 0) ? @"," : @"{";
            
//            [queryString appendFormat:@"%@%@=%@",
//             delimiter,
//             [name stringWithURLEncoding],
//             [value stringWithURLEncoding]];
            [queryString appendFormat:@"%@%@:%@",
             delimiter,
              name,
              value];
        }
        
    }
    
   
    return queryString;
}



#pragma mark NSURLConnection methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
	
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
	
    // receivedData is an instance variable declared elsewhere.
    
   // [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
    
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // release the connection, and the data object
    // receivedData is declared as a method instance elsewhere
    
      
    // inform the user
    UIAlertView *didFailWithErrorMessage = [[UIAlertView alloc] initWithTitle: @"NSURLConnection " message: @"didFailWithError"  delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [didFailWithErrorMessage show];
    
    //inform the user
    NSLog(@"Connection failed! Error - %@",
          [error localizedDescription]);
    //inform the user
//    NSLog(@"Connection failed! Error - %@ %@",
//          [error localizedDescription],
//          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
//    NSLog(@"Succeeded! Received %d bytes of data",[receivedData
//                                                   length]);
    NSString *txt = [[NSString alloc] initWithData:receivedData encoding: NSUTF8StringEncoding] ;
    
    NSLog(@"txt=%@",txt);
    
    
    
    // do something with the data
    // receivedData is declared as an instance variable elsewhere
    // in this example, convert data (from plist) to a string and then to a dictionary
    
    /*NSString *dataString = [[NSString alloc] initWithData: receivedData  encoding:
                            NSMutableDictionary *dictionary = [dataString propertyList];
                           
                            
                            //store data in singleton class for use by other parts of the program
                            SingletonObject *mySharedObject = [SingletonObject sharedSingleton];
                            mySharedObject.aDictionary = dictionary;
                            
                            //alert the user
                            //alert the user
                            NSString *message = [[NSString alloc] initWithFormat:@"Succeeded! Received %d bytes of
                                                 data",[receivedData length]];
                                                 NSLog(message);
                                                 NSLog(@"Dictionary:\n%@",dictionary);
                                                 UIAlertView *finishedLoadingMessage = [[UIAlertView alloc] initWithTitle: @"NSURLConnection " message:message  delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
                                                 [finishedLoadingMessage show];*/
                                                 
                                                
                                                 
                                                 // release the connection, and the data object
                                               
                                                
                                                 }


#pragma mark didReceiveAuthenticationChallenge
-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic]){
        if ([challenge previousFailureCount] == 0){
            NSURLCredential *newCredential;
            NSUserDefaults *defults = [NSUserDefaults standardUserDefaults];
            newCredential = [NSURLCredential credentialWithUser:[defults objectForKey:@"Valuelabs"]
                                                       password:[defults objectForKey:@"t3st123"]
                                                    persistence:NSURLCredentialPersistenceNone];
            
            [[challenge sender] useCredential:newCredential forAuthenticationChallenge:challenge];
//            appDelegate.authChallenge = challenge;
//            appDelegate.responseCode = 200;
        }
        else{
            NSLog (@"failed authentication");
            NSLog(@"Failed login with status code: %d", [(NSHTTPURLResponse*)[challenge failureResponse]statusCode]);
//            appDelegate.responseCode = [(NSHTTPURLResponse*)[challenge failureResponse]statusCode];
            
            [[challenge sender] cancelAuthenticationChallenge:challenge];
            return;
            // inform the user that the user name and password
            // in the preferences are incorrect
            // ...error will be handled by connection didFailWithError
        }
    }
}


- (void)redirectNSLogToDocumentFolder{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
	NSString *documentsDirectory = [paths objectAtIndex:0];
    
	NSString *fileName =[NSString stringWithFormat:@"app%@.log",[NSDate date]];
    
	NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
	freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
