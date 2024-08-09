using ReservaSalao.Domain.Shared;

namespace ReservaSalao.Domain.Auth;

public class UsuarioEntity : IEntity
{
    public int Id { get; set; }
    public required string Nome { get; set; }
    public required string Password { get; set; }
    public required string Email { get; set; }
}
