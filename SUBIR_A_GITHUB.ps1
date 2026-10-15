$ErrorActionPreference = 'Stop'

$sourcePath = (Resolve-Path (Split-Path -Parent $MyInvocation.MyCommand.Path)).Path
$repoUrl = 'https://github.com/JuansePr0/taller-arquitectura.git'
$repoPath = Join-Path (Split-Path -Parent $sourcePath) 'taller-arquitectura'

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'Git no está instalado. Instala Git for Windows y vuelve a ejecutar este archivo.'
}

if ($sourcePath -eq $repoPath) {
    throw 'Extrae el ZIP en una carpeta llamada taller-arquitectura-entrega, separada del clon Git.'
}

if (-not (Test-Path (Join-Path $repoPath '.git'))) {
    if (Test-Path $repoPath) {
        throw "La ruta destino ya existe y no parece un clon Git: $repoPath. Renómbrala o elige otra ubicación."
    }
    Write-Host 'Clonando el repositorio de destino...'
    & git clone $repoUrl $repoPath
    if ($LASTEXITCODE -ne 0) { throw 'No se pudo clonar el repositorio. Comprueba conexión y permisos.' }
} else {
    $status = (& git -C $repoPath status --porcelain)
    if ($LASTEXITCODE -ne 0) { throw 'No se pudo consultar el estado del clon Git.' }
    if ($status) {
        throw "El clon destino tiene cambios locales sin confirmar. Para no sobrescribirlos, revisa primero: $repoPath"
    }
    Write-Host 'Actualizando el clon existente...'
    & git -C $repoPath pull --ff-only origin main
    if ($LASTEXITCODE -ne 0) { throw 'No se pudo actualizar main de forma segura. Revisa el clon y vuelve a ejecutar.' }
}

Write-Host 'Copiando la entrega al clon...'
& robocopy $sourcePath $repoPath /E /XF SUBIR_A_GITHUB.ps1
$copyExitCode = $LASTEXITCODE
if ($copyExitCode -ge 8) { throw "Falló la copia de archivos (robocopy $copyExitCode)." }

& git -C $repoPath add -A
if ($LASTEXITCODE -ne 0) { throw 'git add falló.' }

& git -C $repoPath diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host 'No hay cambios nuevos para subir. El clon ya coincide con estos archivos.'
    exit 0
}

Write-Host 'Archivos que se van a confirmar:'
& git -C $repoPath status --short
& git -C $repoPath commit -m 'Agrega entregables del taller EventFlow y SUMP'
if ($LASTEXITCODE -ne 0) { throw 'git commit falló. Revisa git config user.name y user.email.' }

Write-Host 'Enviando cambios a GitHub...'
& git -C $repoPath push origin main
if ($LASTEXITCODE -ne 0) { throw 'git push falló. Inicia sesión mediante Git Credential Manager o revisa permisos de escritura.' }

Write-Host ''
Write-Host 'Entrega subida. Abre https://github.com/JuansePr0/taller-arquitectura/actions para verificar EventFlow CI.'
Write-Host 'Guarda una captura real cuando el workflow termine. SonarCloud y Terraform requieren configuración independiente.'
