using BlessAuth.CrossCutting;
using MediatR;
using System.Text;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using Microsoft.Extensions.Configuration;
using System.Security.Claims;

public class GerarTokenHandler(IConfiguration configuration) : IRequestHandler<GeraTokenCommand, Result<string>>
{
    public Task<Result<string>> Handle(GeraTokenCommand request, CancellationToken cancellationToken)
    {
        var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"]!));
        var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(           
            issuer: configuration["Jwt:Issuer"],
            audience: configuration["Jwt:Audience"],
            expires: DateTime.Now.AddMinutes(60),
            claims: [
                new Claim("id", request.UsuarioId.ToString()),
                new Claim("email", request.UsuarioEmail),
            ],
            signingCredentials: credentials);

        var stringToken = new JwtSecurityTokenHandler().WriteToken(token);
        return Task.FromResult(Result<string>.Success(stringToken));
    }
}

public record GeraTokenCommand : IRequest<Result<string>> {
    public int UsuarioId { get; set; }
    public required string UsuarioEmail { get; set; }
}
