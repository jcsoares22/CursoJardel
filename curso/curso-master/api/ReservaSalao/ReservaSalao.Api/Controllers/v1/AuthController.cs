using Asp.Versioning;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using ReservaSalao.Application.Auth.CriaUsuario;
using ReservaSalao.Application.Auth.RealizaLogin;
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
        var dadosUsuario = await mediator.Send(command);
        if (dadosUsuario.IsFailure)
        {
            return BadRequest(dadosUsuario.Error);
        }
        return Ok(dadosUsuario);
    }

    [HttpPost("cria-usuario")]
    public async Task<IActionResult> CriaUsuario([FromBody] CriaUsuarioCommand command)
    {
        var usuario = await mediator.Send(command);
        if (usuario.IsFailure)
        {
            return BadRequest(usuario.Error);
        }
        return Ok();
    }

}
