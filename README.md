# MassTransit Sample

This sample is part of the live-coding series available on Twitch and YouTube. For more details, see the [the video page](https://masstransit-project.com/getting-started/live-coding.html).

# The Problem I'm Seeing
The problem I'm seeing is that if an invalid value is passed for an `int` the event will be dequeued, but nothing will happen.  No log message, no exception.

## Changes to Test Issue
1. Switched from RabbitMQ to ActiveMQ
2. Updated the SubmitOrder to mimic my object by adding depth.  I tried just changing `CustomerNumber` to an `int`, but that worked when "", or `false` was passed.  By adding a similar structure to the interface, I could re-create the issue.

## To Test
1. Update the password for ActiveMq from "password123" throughout.
2. Run the SampleServiceProject 
3. Put a breakpoint on `SubmitOrderConsumer.Consume`

Send messages as shown below.  I exported both cases from Postman into two Powershell files.  You will need to update the Authorization header for your environment

To test that it works, run `.\Queue-ok.ps1` and the consumer should get hit

To test that it failes, run `.\Queue-fail.ps1` that passes `false` for `pageNo` and the message will be dequeue, but the consumer is not hit and no messages appear in the log

This is the payload sent in the PowerShell scripts.  Changing `pageNo` to false causes the problem.  Other values seem to let it go through.
```JSON
{
  "messageId": "7a000000-9a3c-0005-1813-08d7e7027a0c",
  "conversationId": "7a000000-9a3c-0005-ed0b-08d7e7027a10",
  "sourceAddress": "activemq://localhost:61616/ULPC15S12C_SampleApi_bus_xeyyyyr48oyymi95bdm6qyucnd?temporary=true",
  "destinationAddress": "activemq://localhost:61616/submit-order",
  "messageType": [
    "urn:message:Sample.Contracts:SubmitOrder"
  ],
  "message": {
    "orderId": "843d0cea-68d8-43f6-8e23-1141cbce939c",
    "timestamp": "2020-04-22T21:16:51.8263213Z",
    "customerNumber": false,
        "forms": [
            {
                "formData": {
                    "_id": "",
                    "schema": "",
                    "formType": "",
                    "pageNo": "",
                    "metadata": {
                        "docId": "",
                        "pageNo": false,
                        "claimNumber": "",
                        "claimId": "",
                        "clientName": "",
                        "clientId": "",
                        "createdDateTime": ""
                    }
                }
            }
        ]
    
  },
  "sentTime": "2020-04-22T21:16:51.9778323Z",
  "headers": {
    "MT-Activity-Id": "00-1e03f9b1b84f3d40b7087f2633fadd4a-38ac2fc84b035447-00"
  },
  "host": {
    "machineName": "ULPC15S12C",
    "processName": "Sample.Api",
    "processId": 25968,
    "assembly": "Sample.Api",
    "assemblyVersion": "1.0.0.0",
    "frameworkVersion": "3.1.3",
    "massTransitVersion": "6.2.5.0",
    "operatingSystemVersion": "Microsoft Windows NT 6.2.9200.0"
  }
}
```