using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using ReservaSalao.Domain.Shared;
using ReservaSalao.Infra.Contexts;
using System.Linq.Expressions;

namespace ReservaSalao.Infra.Repositories;

public class Repository<T> : IRepository<T> where T : class
{
    protected ReservaSalaoDbContext _context;

    public IDbContextTransaction StartTransaction()
    {
        return _context.Database.BeginTransaction();
    }

    public Repository(ReservaSalaoDbContext context)
    {
        _context = context;
    }

    public async Task ExcluirAsync(Expression<Func<T, bool>> expression)
    {
        var entity = _context.Set<T>().Where(expression).SingleOrDefault() ?? throw new Exception("RP01 - Registro não encontrado");
        _context.Remove(entity);
        await _context.SaveChangesAsync();
    }

    public async Task<T> GravaAsync(T entity, int codigo)
    {
        if (codigo == 0)
        {
            await _context.AddAsync(entity);
        }
        await _context.SaveChangesAsync();
        return entity;
    }

    public async Task<IList<T>> PesquisaAsync(List<Expression<Func<T, bool>>> expressions, bool hasNoTracking = true)
    {
        IQueryable<T> consulta = _context.Set<T>();

        if (hasNoTracking)
        {
            consulta = consulta.AsNoTracking();
        }

        foreach (var e in expressions)
        {
            consulta = consulta.Where(e);
        }

        return await consulta.ToListAsync();
    }


    public async Task<IList<T>> PesquisaAsync(Expression<Func<T, bool>> expression, bool hasNoTracking = true)
    {
        return await PesquisaAsync(new List<Expression<Func<T, bool>>> { expression }, hasNoTracking);
    }
}
