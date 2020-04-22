$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Basic CHANGEME")
$headers.Add("Content-Type", "text/plain")
$headers.Add("Cookie", "JSESSIONID=1vcx4vn560lmw15i2wvdt4zvlq")

$body = "{
`n  `"messageId`": `"7a000000-9a3c-0005-1813-08d7e7027a0c`",
`n  `"conversationId`": `"7a000000-9a3c-0005-ed0b-08d7e7027a10`",
`n  `"sourceAddress`": `"activemq://localhost:61616/ULPC15S12C_SampleApi_bus_xeyyyyr48oyymi95bdm6qyucnd?temporary=true`",
`n  `"destinationAddress`": `"activemq://localhost:61616/submit-order`",
`n  `"messageType`": [
`n    `"urn:message:Sample.Contracts:SubmitOrder`"
`n  ],
`n  `"message`": {
`n    `"orderId`": `"843d0cea-68d8-43f6-8e23-1141cbce939c`",
`n    `"timestamp`": `"2020-04-22T21:16:51.8263213Z`",
`n    `"customerNumber`": false,
`n        `"forms`": [
`n            {
`n                `"formData`": {
`n                    `"_id`": `"`",
`n                    `"schema`": `"`",
`n                    `"formType`": `"`",
`n                    `"pageNo`": `"`",
`n                    `"metadata`": {
`n                        `"docId`": `"`",
`n                        `"pageNo`": false,
`n                        `"claimNumber`": `"`",
`n                        `"claimId`": `"`",
`n                        `"clientName`": `"`",
`n                        `"clientId`": `"`",
`n                        `"createdDateTime`": `"`"
`n                    }
`n                }
`n            }
`n        ]
`n    
`n  },
`n  `"sentTime`": `"2020-04-22T21:16:51.9778323Z`",
`n  `"headers`": {
`n    `"MT-Activity-Id`": `"00-1e03f9b1b84f3d40b7087f2633fadd4a-38ac2fc84b035447-00`"
`n  },
`n  `"host`": {
`n    `"machineName`": `"ULPC15S12C`",
`n    `"processName`": `"Sample.Api`",
`n    `"processId`": 25968,
`n    `"assembly`": `"Sample.Api`",
`n    `"assemblyVersion`": `"1.0.0.0`",
`n    `"frameworkVersion`": `"3.1.3`",
`n    `"massTransitVersion`": `"6.2.5.0`",
`n    `"operatingSystemVersion`": `"Microsoft Windows NT 6.2.9200.0`"
`n  }
`n}"

Invoke-RestMethod 'http://localhost:8161/api/message/submit-order?type=queue' -Method 'POST' -Headers $headers -Body $body
