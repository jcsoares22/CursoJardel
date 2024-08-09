using Microsoft.EntityFrameworkCore;
using ReservaSalao.Domain.Auth;

namespace ReservaSalao.Infra.Contexts;

public class ReservaSalaoDbContext : DbContext
{
    public DbSet<UsuarioEntity> Usuarios => Set<UsuarioEntity>();
    public ReservaSalaoDbContext() { }
    public ReservaSalaoDbContext(DbContextOptions<ReservaSalaoDbContext> options) : base(options) { }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(ReservaSalaoDbContext).Assembly);
    }
}
