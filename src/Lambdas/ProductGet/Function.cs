using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;
using System.Collections.Generic;
using System.Threading.Tasks;

// Assembly attribute to enable the Lambda function's JSON input to be converted into a .NET class.
[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.SystemTextJson.DefaultLambdaJsonSerializer))]

namespace ProductGet;

public class Function
{
    public Task<APIGatewayProxyResponse> FunctionHandler(APIGatewayProxyRequest @event, ILambdaContext context)
    {
        return Task.FromResult(new APIGatewayProxyResponse
        {
            Body = "{ \"message\": \"ok\" }",
            StatusCode = 200,
            Headers = new Dictionary<string, string> { { "Content-Type", "application/json" } }
        });
    }
}
