using Enviri.PO.WebUI.Client.Services;
using Enviri.PO.WebUI.Services;
using Enviri.SharedLibrary.PORespositories;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Radzen;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

builder.Services.AddScoped<IPORepository, PurchaseOrderService>();
builder.Services.AddScoped<IDepartmentRepository, DepartmentService>();
builder.Services.AddScoped<IVendorRepository, VendorMasterService>();
builder.Services.AddRadzenComponents();
builder.Services.AddScoped(http => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress), });
builder.Services.AddBlazorBootstrap();
await builder.Build().RunAsync();
