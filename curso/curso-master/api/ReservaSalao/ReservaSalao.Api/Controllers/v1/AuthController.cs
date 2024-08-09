using Asp.Versioning;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using ReservaSalao.Application.Auth;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

namespace ReservaSalao.Api.Controllers.v1;

[ApiController]
[ApiVersion("1.0")]
[Route("v{version:apiVersion}/auth")]
[AllowAnonymous]
public class AuthController(IMediator mediator) : ControllerBase
{
    [Authorize]
    [HttpGet("status")]
    public IActionResult RetornaStatus()
    {
        return Ok("OK!!");
    }

    [HttpPost("realiza-login")]
    public async Task<IActionResult> RealizaLogin([FromBody] RealizaLoginCommand command)
    {
        var token = await mediator.Send(command);
        return Ok(token);
    }

    [HttpGet("gera-token")]
    public IActionResult GerarToken([FromServices] IConfiguration configuration)
    {
        var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"]!));
        var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: configuration["Jwt:Issuer"],
            audience: configuration["Jwt:Audience"],
            expires: DateTime.Now.AddMinutes(60),
            signingCredentials: credentials);


        return Ok(new JwtSecurityTokenHandler().WriteToken(token));
    }

}
