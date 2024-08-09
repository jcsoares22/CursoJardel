using Asp.Versioning.ApiExplorer;

namespace ReservaSalao.Api.Configs
{
    public static class SwaggerUIExtension
    {
        public static void UseSwaggerUiExtension(this IApplicationBuilder app, IApiVersionDescriptionProvider apiVersionDescriptionProvider)
        {
            app.UseSwaggerUI(o =>
            {
                foreach (var description in apiVersionDescriptionProvider.ApiVersionDescriptions)
                {
                    o.SwaggerEndpoint($"/swagger/{description.GroupName}/swagger.json",
                        $"Reserva Salão - {description.GroupName.ToUpper()}");
                }
            });
        }
    }
}
