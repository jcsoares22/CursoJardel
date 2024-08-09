using Microsoft.EntityFrameworkCore;
using ReservaSalao.Infra.Contexts;

namespace ReservaSalao.Api.Configs;

public static class ConnectionExtension
{
    public static IServiceCollection AddConnection(this IServiceCollection services, IConfiguration configuration)
    {
        var stringConexao = RetornaStringConexao(configuration);
       // services.AddScoped<IDbConnection>((sp) => new FbConnection(stringConexao));
        services.AddDbContext<ReservaSalaoDbContext>(options => options.UseMySQL(stringConexao));
        return services;
    }

    public static string RetornaStringConexao(IConfiguration configuration)
    {
        var stringConexao = configuration.GetConnectionString("DefaultConnection");

        if (Environment.GetEnvironmentVariable("DEPLOY_DOCKER") == "S")
        {
            var server = RetornaVariavel("SERVER", "localhost");
            var password = RetornaVariavel("PASSWORD", "Bryan@32261767");
            var database = RetornaVariavel("DATABASE", "reserva_salao");
            var user = RetornaVariavel("USER", "root");
            stringConexao = $"Server={server};Database={database};User={user};Password={password};";
        }

        if (stringConexao != null)
        {
            return stringConexao;
        }

        return "String conexão não localizada";
    }

    private static string RetornaVariavel(string campo, string valorPadrao)
    {
        var variavel = Environment.GetEnvironmentVariable(campo);
        if (variavel == null || variavel == "")
        {
            return valorPadrao;
        }
        return variavel ?? "";
    }
}
