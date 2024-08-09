using BlessAuth.CrossCutting;
using MediatR;
using ReservaSalao.Domain.Shared;

namespace ReservaSalao.Application.Auth;

public class RealizaLoginHandler(IUnitOfWork unitOfWork) : IRequestHandler<RealizaLoginCommand, Result<String>>
{
    public async Task<Result<String>> Handle(RealizaLoginCommand request, CancellationToken cancellationToken)
    {
        var consulta = await unitOfWork.UsuarioRepository.PesquisaAsync(x => x.Email == request.Email);
        return Result<String>.Success("deu certo");
    }
}

public record RealizaLoginCommand : IRequest<Result<String>>
{
    public required string Email { get; init; }
    public required string Password { get; init; }
}
