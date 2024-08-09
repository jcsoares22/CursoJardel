using Microsoft.AspNetCore.Mvc;

namespace ReservaSalao.Api.Configs;

public static class ProblemDetailsExtensions
{
    public static IServiceCollection AddProblemDetailsModelState(this IServiceCollection services)
    {
        return services.Configure<ApiBehaviorOptions>(options =>
        {
            options.InvalidModelStateResponseFactory = context =>
            {
                KeyValuePair<string, Microsoft.AspNetCore.Mvc.ModelBinding.ModelStateEntry?> error = context.ModelState.FirstOrDefault();

                string detalhes = "";
                foreach (KeyValuePair<string, Microsoft.AspNetCore.Mvc.ModelBinding.ModelStateEntry> e in context.ModelState)
                {
                    detalhes += e.Value.Errors[0].ErrorMessage;
                }

                ValidationProblemDetails problemDetails = new(context.ModelState)
                {
                    Title = error.Value == null ? "" : error.Value.Errors[0].ErrorMessage,
                    Instance = context.HttpContext.Request.Path,
                    Status = StatusCodes.Status400BadRequest,
                    Detail = detalhes,
                };

                return new BadRequestObjectResult(problemDetails)
                {
                    ContentTypes = { "application/problem+json", "application/problem+xml" }
                };
            };
        });
    }
}
