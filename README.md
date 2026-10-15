# Taller de Arquitectura de Software — EventFlow y SUMP

Repositorio independiente para la entrega académica de Arquitectura de Software. **Este proyecto no está relacionado con ERP-Restaurant.**

## Casos de estudio

- **EventFlow:** plataforma de descubrimiento y venta de boletas para eventos.
- **SUMP:** sistema universitario de matrículas y pagos, usado como caso complementario de análisis arquitectónico.

## Estructura

- `index.html`, `styles.css`, `app.js`: prototipo estático de EventFlow.
- `.github/workflows/ci.yml`: integración continua en GitHub Actions.
- `main.tf`: ejemplo académico de infraestructura como código para Google Cloud.
- `diagramas/`: diagramas Mermaid editables para arquitectura y modelo de dominio.
- `docs/Informe_JuanRubio_Arquitectura_Software_EventFlow_SUMP_FINAL.docx`: informe técnico de la actividad.
- `INSTRUCCIONES_EVIDENCIAS.md`: lista de evidencias que aún requieren ejecución externa real.

## Ejecutar el prototipo

Abre `index.html` en un navegador moderno. No requiere instalar dependencias. Los botones simulan la selección de un evento y muestran un mensaje; **no reservan boletas reales ni procesan pagos**.

## Integración continua

GitHub Actions se ejecuta al hacer `push`, al abrir un `pull_request` contra `main` y manualmente. Revisa archivos requeridos, sintaxis JavaScript y formato básico de Terraform. Estas comprobaciones son iniciales y no equivalen a una auditoría de seguridad o pruebas de carga.

## Terraform y seguridad

`main.tf` es un ejemplo, no infraestructura ya desplegada. Para ejecutarlo hay que configurar Google Cloud, autenticación, permisos y un `project_id` válido. Revisa especialmente el alcance de las reglas de firewall y los posibles costos. Ejecuta `terraform plan` antes de cualquier despliegue; no ejecutes `terraform apply` sin revisión y autorización explícitas.

## Diseño

- [FigJam — Arquitectura de EventFlow](https://www.figma.com/board/NIXL3JswU0W1aFhl377SP2)
- [FigJam — Arquitectura actual y riesgos de SUMP](https://www.figma.com/board/zj3O072LFwihh1MxazaEGL)
- [Figma — Wireframes de EventFlow](https://www.figma.com/design/f4lXLJ9iF9sxUeTzTlsu96)

## Evidencias pendientes

El workflow se debe verificar después de subir los archivos. SonarCloud debe conectarse por separado y Terraform requiere configuración de nube para producir resultados reales. Consulta `INSTRUCCIONES_EVIDENCIAS.md` y no presentes capturas simuladas como evidencias reales.
