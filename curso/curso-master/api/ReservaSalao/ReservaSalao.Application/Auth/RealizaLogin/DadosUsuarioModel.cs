namespace ReservaSalao.Application.Auth.RealizaLogin;

public record DadosUsuarioModel
{
    public required string Nome { get; set; }
    public required string Token { get; set; }
}
