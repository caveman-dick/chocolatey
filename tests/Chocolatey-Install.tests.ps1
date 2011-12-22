$here   = Split-Path -Parent $MyInvocation.MyCommand.Definition
$src    = Join-Path (Split-Path $here) 'src'
$script = Join-Path $src 'chocolatey.ps1'

. $script

function Chocolatey-PackagesConfig {
    $script:wascalled = $true
}

Describe "When installing packages from a manifest" {
    
    Setup -File 'packages.config' @"
<?xml version="1.0" encoding="utf-8"?>
<packages>
    <package id="chocolateytestpackage" version="0.1" />
</packages>    
"@

    Chocolatey-Install "TestDrive:\packages.config"

    It "should call the chocolatey packages config function" {
        $wascalled.should.be($true)
    }

}