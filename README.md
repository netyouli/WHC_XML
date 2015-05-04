# WHC_XML
自动把字典转换为xml数据
####Use Example
```objective-c
NSDictionary * REQHDR = @{@"TrnNum":@"INHB2015042900000001",@"TrnCode":@"1957747793"};
    NSDictionary * REQBDY = @{@"OS":@"iPhone",@"App":@"CC",@"IconVersion":@""};
    NSDictionary * ebMobileStartupInqR = @{@"REQHDR":REQHDR,@"REQBDY":REQBDY};
    NSDictionary * xmlDic = @{@"ebMobileStartupInqRq":ebMobileStartupInqR};
    //use one
    NSString  * xmlStringOne = [WHC_Xml xmlWithDictionary:xmlDic];
    //use two
    NSString  * xmlStringTwo = [WHC_Xml xmlWithDictionary:xmlDic rootAttribute:@"xmlns = \"http://ns.chinatrust.com.tw/XSD/CTCB/ESB/Message/BSMF/ebMobileStartupInqRq/01\""];
    
    NSLog(@"xmlStringOne = %@",xmlStringOne);
    //xmlStringOne =     NSString  * xml = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
    <ebMobileStartupInqRq >\
        <REQHDR>\
            <TrnNum>INHB2015042900000001</TrnNum>\
            <TrnCode>1957747793</TrnCode>\
        </REQHDR>\
        <REQBDY>\
            <OS>iPhone</OS>\
            <App>CC</App>\
            <IconVersion></IconVersion>\
        </REQBDY>\
    </ebMobileStartupInqRq>";
    
    
    NSLog(@"xmlStringTwo = %@",xmlStringTwo);
    //xmlStringTwo =     NSString  * xml = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
    <ebMobileStartupInqRq xmlns=\"http://ns.chinatrust.com.tw/XSD/CTCB/ESB/Message/BSMF/ebMobileStartupInqRq/01\">\
        <REQHDR>\
            <TrnNum>INHB2015042900000001</TrnNum>\
            <TrnCode>1957747793</TrnCode>\
        </REQHDR>\
        <REQBDY>\
            <OS>iPhone</OS>\
            <App>CC</App>\
            <IconVersion></IconVersion>\
        </REQBDY>\
    </ebMobileStartupInqRq>";


```
