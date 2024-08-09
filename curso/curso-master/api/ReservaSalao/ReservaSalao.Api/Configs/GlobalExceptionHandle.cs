using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace ReservaSalao.Api.Configs;

internal sealed class GlobalExceptionHandle : IExceptionHandler
{
    private readonly ILogger<GlobalExceptionHandle> _logger;

    public GlobalExceptionHandle(ILogger<GlobalExceptionHandle> logger) => _logger = logger;

    public async ValueTask<bool> TryHandleAsync(HttpContext httpContext, Exception exception, CancellationToken cancellationToken)
    {
        _logger.LogError(
            exception, "Exception: {Message}", exception.Message);

        var problemDetails = new ProblemDetails
        {
            Status = httpContext.Response.StatusCode,
            Title = exception.Message,
            Detail = exception!.InnerException != null ? exception.InnerException.ToString() : ""
        };

        httpContext.Response.StatusCode = problemDetails.Status.Value;

        await httpContext.Response
            .WriteAsJsonAsync(problemDetails, cancellationToken);

        return true;
    }
}
