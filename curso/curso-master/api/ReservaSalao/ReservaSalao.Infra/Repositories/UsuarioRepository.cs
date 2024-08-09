using ReservaSalao.Domain.Auth;
using ReservaSalao.Infra.Contexts;

namespace ReservaSalao.Infra.Repositories;

public class UsuarioRepository(ReservaSalaoDbContext context) : Repository<UsuarioEntity>(context), IUsuarioRepository
{
}
