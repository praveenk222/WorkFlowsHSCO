using Enviri.PO.WebUI;
using Enviri.PO.WebUI.Client.Pages;
using Enviri.PO.WebUI.Components;
using Enviri.PO.WebUI.Data;
using Enviri.PO.WebUI.Implementations;
using Enviri.PO.WebUI.Services;
using Enviri.SharedLibrary.PORespositories;
using Microsoft.EntityFrameworkCore;
using Radzen;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
#region Connection String
builder.Services.AddDbContext<POContext>(item => item.UseSqlServer(builder.Configuration.GetConnectionString("Harsco.HTS.connectionString")));
#endregion
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents()
    .AddInteractiveWebAssemblyComponents();

builder.Services.AddScoped<EmployeeService>();
builder.Services.AddScoped<IPORepository, PORepository>();
builder.Services.AddScoped<IDepartmentRepository, DepartmentRepository>();
builder.Services.AddScoped<IVendorRepository, VendorRepository>();
//builder.Services.AddScoped<IDapperDbConnection, DapperDbConnection>();
builder.Services.AddScoped(http => new HttpClient { BaseAddress = new Uri(builder.Configuration.GetSection("BaseAddress").Value!) });
builder.Services.AddControllers();
builder.Services.AddRadzenComponents();
builder.Services.AddBlazorBootstrap();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode()
    .AddInteractiveWebAssemblyRenderMode()
    .AddAdditionalAssemblies(typeof(Enviri.PO.WebUI.Client._Imports).Assembly);

app.Run();
