using BlessAuth.CrossCutting;
using MediatR;
using ReservaSalao.Domain.Shared;
using System.ComponentModel.DataAnnotations;

namespace ReservaSalao.Application.Auth.RealizaLogin;

public class RealizaLoginHandler(IUnitOfWork unitOfWork, IMediator mediator) : IRequestHandler<RealizaLoginCommand, Result<DadosUsuarioModel>>
{
    public async Task<Result<DadosUsuarioModel>> Handle(RealizaLoginCommand request, CancellationToken cancellationToken)
    {
        var consulta = await unitOfWork.UsuarioRepository.PesquisaAsync(x => x.Email == request.Email);

        if (consulta.Count == 0)
            return Result<DadosUsuarioModel>.Failure("RLH01", "Email inválido!");

        var usuario = consulta.First();
        if (usuario.Password != request.Password)
            return Result<DadosUsuarioModel>.Failure("RLH02", "Email/Password inválido!");

        var tokenCommand = new GeraTokenCommand() { UsuarioEmail = request.Email, UsuarioId = usuario.Id };
        var token = await mediator.Send(tokenCommand, cancellationToken);

        return Result<DadosUsuarioModel>.Success(new DadosUsuarioModel()
        {
            Nome = usuario.Nome,
            Token = token.Value,
        });
    }
}

public record RealizaLoginCommand : IRequest<Result<DadosUsuarioModel>>
{
    [Required(ErrorMessage = "O campo Email deve ser preenchido")]
    public required string Email { get; init; }

    [Required(ErrorMessage = "O campo Password deve ser preenchido")]
    public required string Password { get; init; }
}
