function get-gitstatus { git status }

# Touch: create a file if it doesn't exist
function touch {
    $file = $args[0]

    if ($null -eq $file || $file -eq "") {
        throw "No file specified"
        return
    }

    # Check if file exists
    if (Test-Path $file) {
        do {
            $response = Read-Host -Prompt "File already exists. Overwrite? (y/n)"

            if ($response -eq "n") {
                return
            } elseif ($response -eq "y") {
                Write-Host "Overwriting file..."
                Remove-Item $file -Force
            }

        } until ($response -eq "y" || $response -eq "n")
    }

    # Create file
    New-Item -ItemType File -Path $file
    Write-Host "$file created"
}

# Which: finds the full path of the command given as an argument
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}