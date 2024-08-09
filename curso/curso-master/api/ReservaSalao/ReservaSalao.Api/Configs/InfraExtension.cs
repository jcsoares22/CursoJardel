using ReservaSalao.Domain.Auth;
using ReservaSalao.Domain.Shared;
using ReservaSalao.Infra.Repositories;

namespace ReservaSalao.Api.Configs;

public static class InfraExtension
{
    public static IServiceCollection AddInfra(this IServiceCollection services)
    {
        services.AddScoped<IUnitOfWork, UnitOfWork>();
        services.AddScoped<IUsuarioRepository, UsuarioRepository>();
        return services;
    }
}
