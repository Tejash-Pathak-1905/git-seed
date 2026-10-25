<#
.SYNOPSIS
    git-seed runner for Windows (PowerShell)
.DESCRIPTION
    Seamlessly runs git-seed's setup.sh using your installed Git environment.
#>

[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$ScriptArgs
)

$ErrorActionPreference = "Stop"

# Locate Git's bash.exe
$gitBash = $null

# 1. Probe via git command
$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if ($gitCmd -and $gitCmd.Source) {
    $gitDir = Split-Path (Split-Path $gitCmd.Source)
    $candidates = @(
        (Join-Path $gitDir "bin\bash.exe"),
        (Join-Path $gitDir "usr\bin\bash.exe")
    )
    foreach ($c in $candidates) {
        if (Test-Path $c) {
            $gitBash = $c
            break
        }
    }
}

# 2. Probe standard Git for Windows install paths
if (-not $gitBash) {
    $searchPaths = @(
        "C:\Program Files\Git\bin\bash.exe",
        "C:\Program Files (x86)\Git\bin\bash.exe",
        "C:\Program Files\Git\usr\bin\bash.exe",
        (Join-Path $env:LOCALAPPDATA "Programs\Git\bin\bash.exe"),
        (Join-Path $env:USERPROFILE "scoop\apps\git\current\bin\bash.exe")
    )
    foreach ($p in $searchPaths) {
        if ($p -and (Test-Path $p)) {
            $gitBash = $p
            break
        }
    }
}

if (-not $gitBash) {
    Write-Host "[git-seed] Error: Git for Windows was not found." -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/ and try again." -ForegroundColor Yellow
    exit 1
}

$setupScript = Join-Path $PSScriptRoot "setup.sh"
if (-not (Test-Path $setupScript)) {
    Write-Host "[git-seed] Error: setup.sh not found in $PSScriptRoot" -ForegroundColor Red
    exit 1
}

$setupScriptUnix = $setupScript -replace '\\', '/'

& $gitBash $setupScriptUnix @ScriptArgs
exit $LASTEXITCODE
