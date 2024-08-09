namespace ReservaSalao.Api.Configs;

public static class CORSExtension
{
    public static IServiceCollection AddCorsPolicy(this IServiceCollection services, string policyName)
    {
        services.AddCors(options =>
        {
            options.AddPolicy(policyName,
                builder => builder.AllowAnyMethod().
                    AllowAnyHeader().
                    AllowCredentials().
                    SetIsOriginAllowed((hosts) => true));
        });
        return services;
    }
}
