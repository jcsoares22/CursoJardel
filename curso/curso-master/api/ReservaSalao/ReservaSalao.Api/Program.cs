using Asp.Versioning.ApiExplorer;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using ReservaSalao.Api.Configs;
using ReservaSalao.Application.Shared;
using System.Text;

const String policyName = "CORSPolicy";

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddConnection(builder.Configuration);
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerVersioningExtension();
builder.Services.AddApplication();
builder.Services.AddInfra();
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(AppSettings).Assembly));
builder.Services.AddCorsPolicy(policyName);
builder.Services.AddExceptionHandler<GlobalExceptionHandle>();
builder.Services.AddProblemDetails();
builder.Services.AddProblemDetailsModelState();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerCustom();

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
        .AddJwtBearer(options =>
        {
            options.TokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true,
                ValidateIssuerSigningKey = true,
                ValidIssuer = builder.Configuration["Jwt:Issuer"],
                ValidAudience = builder.Configuration["Jwt:Audience"],
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]!))
            };
        });

builder.Services.AddAuthorization();

var app = builder.Build();

app.UseExceptionHandler();
app.UseSwagger();
app.UseSwaggerUiExtension(app.Services.GetRequiredService<IApiVersionDescriptionProvider>());
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseCors(policyName);
app.UseAuthorization();

app.MapControllers();

app.Run();
