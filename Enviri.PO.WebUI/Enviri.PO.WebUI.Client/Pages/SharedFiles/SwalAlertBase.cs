using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;

namespace Enviri.PO.WebUI.Client.Pages.SharedFiles
{
    public class SwalAlertBase : ComponentBase
    {
        protected readonly IJSRuntime _jsRuntime;

        public SwalAlertBase(IJSRuntime jsRuntime)
        {
            _jsRuntime = jsRuntime;
        }
        protected bool ShowConfirmation { get; set; }

        [Parameter]
        public string ConfirmationTitle { get; set; } = "Confirm Delete";

        [Parameter]
        public string ConfirmationMessage { get; set; } = "Are you sure you want to delete";

        public void Show()
        {
            ShowConfirmation = true;
            StateHasChanged();
        }

        [Parameter]
        public EventCallback<bool> ConfirmationChanged { get; set; }

        protected async Task OnConfirmationChange(bool value)
        {
            ShowConfirmation = false;
            await ConfirmationChanged.InvokeAsync(value);
        }

        public void ShowSuccess()
        {
             _jsRuntime.InvokeVoidAsync("ShowToastr", "success", "testse");
        }
    }
}
