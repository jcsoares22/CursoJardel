namespace ReservaSalao.Api.Configs;

public static class ApplicationExtension
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
       // services.AddScoped<ICriptografia, Criptografia>();
        return services;
    }
}
