
using Microsoft.EntityFrameworkCore.Storage;
using ReservaSalao.Domain.Auth;
using ReservaSalao.Domain.Shared;
using ReservaSalao.Infra.Contexts;

namespace ReservaSalao.Infra.Repositories;

public class UnitOfWork(ReservaSalaoDbContext Context, IUsuarioRepository usuarioRepository) : IUnitOfWork
{

    private IDbContextTransaction? _transaction;

    public IUsuarioRepository UsuarioRepository => usuarioRepository;

    public void Dispose()
    {
        GC.SuppressFinalize(this);
    }

    public async Task StartTransactionAsync()
    {
        if (_transaction != null)
            throw new Exception("UOW01 - Já existe uma transação iniciada");

        _transaction = await Context.Database.BeginTransactionAsync();
    }

    public async Task CommitTransactionAsync()
    {
        await _transaction!.CommitAsync();
        _transaction.Dispose();
        _transaction = null;
    }

    public async Task RollbackTransactionAsync()
    {
        await _transaction!.RollbackAsync();
        _transaction.Dispose();
        _transaction = null;
    }
}
