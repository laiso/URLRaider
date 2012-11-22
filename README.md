
**Recommended that use other alternative libraries.**
=============================================================

[iOS/OS Xテスト向けのURL読み込みに偽のレスポンスを返すモジュールいろいろ - laiso - iPhoneアプリ開発グループ](http://iphone-dev.g.hatena.ne.jp/laiso/20121122/1353588955 "iOS/OS Xテスト向けのURL読み込みに偽のレスポンスを返すモジュールいろいろ - laiso - iPhoneアプリ開発グループ")


URLRaider
===========

A test helper for rewriting responses at Cocoa URL request API.

    NSURL* url = [NSURL URLWithString:@"http://example.com/api/hi.json"];
    NSString* fakeResponse = @"{\"title\": \"Hello, 世界!\"}";
    [URLRaider order:url body:fakeResponse];

    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

    NSString* responseText = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    STAssertEqualObjects(responseText, fakeResponse, nil);
    STAssertEqualObjects(responseData, [fakeResponse dataUsingEncoding:NSUTF8StringEncoding], nil);

    [URLRaider purge];
