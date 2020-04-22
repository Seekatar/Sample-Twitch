namespace Sample.Contracts
{
    using System;
    using System.Collections.Generic;
    using MassTransit;

	// add multiple levels of depth to re-create problem

    public interface MetaData
    {
        int PageNo { get; }  // if pass "false" in JSON for this, nothing happens
    }

    public interface FormData
    {
        MetaData MetaData { get;  }
    }


    public interface Forms
    {
        FormData FormData { get; }
    }

        public interface SubmitOrder
    {
        Guid OrderId { get; }
        DateTime Timestamp { get; }

		// this works
        [Newtonsoft.Json.JsonProperty("pageNo", Required = Newtonsoft.Json.Required.DisallowNull, NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore)]
        int CustomerNumber { get; }
        string PaymentCardNumber { get; }

        MessageData<string> Notes { get; }

        List<Forms> Forms { get; }
    }
}