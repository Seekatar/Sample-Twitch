curl --location --request POST 'http://localhost:8161/api/message/submit-order?type=queue' \
--header 'Content-Type: application/json' \
--header 'Authorization: Basic REPLACETHIS' \
--header 'Content-Type: text/plain' \
--header 'Cookie: JSESSIONID=w6m2o4trz7j61qian92glxxd5' \
--data-raw '{
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
}'