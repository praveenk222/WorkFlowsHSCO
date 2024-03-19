using Microsoft.JSInterop;

namespace Enviri.PO.WebUI.Client.Services
{
    public class MyService
    {
        private readonly IJSRuntime _jsRuntime;

        public MyService(IJSRuntime jsRuntime)
        {
            _jsRuntime = jsRuntime;
        }

        public async Task ShowSuccess()
        {
            await _jsRuntime.InvokeVoidAsync("ShowToastr", "success", "testse");
        }
    }
}
