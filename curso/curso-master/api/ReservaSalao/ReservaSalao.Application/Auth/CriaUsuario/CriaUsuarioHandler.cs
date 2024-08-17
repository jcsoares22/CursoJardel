using BlessAuth.CrossCutting;
using MediatR;
using ReservaSalao.Domain.Auth;
using ReservaSalao.Domain.Shared;
using System.ComponentModel.DataAnnotations;

namespace ReservaSalao.Application.Auth.CriaUsuario;

public class CriaUsuarioHandler(IUnitOfWork unitOfWork) : IRequestHandler<CriaUsuarioCommand, Result<Unit>>
{
    public async Task<Result<Unit>> Handle(CriaUsuarioCommand request, CancellationToken cancellationToken)
    {
        var verificaEmailUsuario = await unitOfWork.UsuarioRepository.PesquisaAsync(x => x.Email == request.Email);

        if (verificaEmailUsuario.Count > 0)
            return Result<Unit>.Failure("CUH01", "Já existe um usuário com esse email");

        if (request.Password.Length < 3)
            return Result<Unit>.Failure("CUH04", "O password deve ter mais de 3 caracteres");

        if (request.Password.Length > 20)
            return Result<Unit>.Failure("CUH04", "O password não pode ter mais de 20 caracteres");

        if (request.Password != request.PasswordConfirmacao)
            return Result<Unit>.Failure("CUH02", "O password está diferente do campo password confirmação");

        var usuarioEntity = new UsuarioEntity()
        {
            Email = request.Email,
            Nome = request.Nome,
            Password = request.Password
        };

        try
        {
            await unitOfWork.StartTransactionAsync();
            await unitOfWork.UsuarioRepository.GravaAsync(usuarioEntity, 0);
            await unitOfWork.CommitTransactionAsync();
            return Result<Unit>.Success(Unit.Value);
        }
        catch (Exception e)
        {
            await unitOfWork.RollbackTransactionAsync();
            return Result<Unit>.Failure("CUH03", e.Message);
        }
    }
}

public record CriaUsuarioCommand() : IRequest<Result<Unit>> {
    [Required(ErrorMessage = "O campo Email deve ser preenchido")]
    public required string Email { get; set; }

    [Required(ErrorMessage = "O campo Password deve ser preenchido")]
    public required string Password { get; set; }

    [Required(ErrorMessage = "O campo Password Confirmação deve ser preenchido")]
    public required string PasswordConfirmacao { get; set; }

    [Required(ErrorMessage = "O campo Nome deve ser preenchido")]
    public required string Nome { get; set; }
}

