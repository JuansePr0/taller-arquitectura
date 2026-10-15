const buttons = document.querySelectorAll(".buy-button");
const statusMessage = document.querySelector("#status");

buttons.forEach((button) => {
  button.addEventListener("click", () => {
    const eventName = button.dataset.event;
    button.disabled = true;
    const previousLabel = button.textContent;
    button.textContent = "Procesando...";
    statusMessage.textContent = `Verificando disponibilidad para ${eventName}.`;
    // Demo only: this does not process payments or reserve real tickets.
    window.setTimeout(() => {
      button.disabled = false;
      button.textContent = previousLabel;
      statusMessage.textContent = `Demostración: ${eventName} seleccionado. No se realizó ningún cobro.`;
    }, 700);
  });
});
