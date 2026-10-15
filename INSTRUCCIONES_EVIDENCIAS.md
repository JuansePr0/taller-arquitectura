# Evidencias de ejecución pendientes

El repositorio `JuansePr0/taller-arquitectura` ya existe. Después de cargar estos archivos:

- [ ] Abrir la pestaña **Actions** y confirmar que `EventFlow CI` termine correctamente; guardar una captura real del resultado.
- [ ] Conectar SonarCloud a este repositorio por separado y guardar una captura del análisis real, si lo exige la guía.
- [ ] Para Terraform, configurar una cuenta/proyecto de Google Cloud, autenticación y `project_id`; ejecutar `terraform init`, `terraform fmt -check`, `terraform validate` y `terraform plan`.
- [ ] No ejecutar `terraform apply` sin autorización explícita y revisión de permisos, firewall y costos.
- [ ] Completar en la portada del informe los integrantes, docente y cualquier dato que falte.
- [ ] Adjuntar capturas reales de GitHub Actions, SonarCloud y Terraform al informe si las solicita el docente.

## Límites de lo preparado

El prototipo es estático: no tiene backend, base de datos, reserva transaccional ni pasarela de pago. La CI hace comprobaciones iniciales; no reemplaza pruebas unitarias, de carga, de seguridad o de accesibilidad. El archivo Terraform es una plantilla académica y no indica que recursos de nube estén desplegados.
