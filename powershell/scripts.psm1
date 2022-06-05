function get-gitstatus { git status }

function touch {
    $file = $args[0]

    # if no filename supplied
    if ($file -eq $null) {
        throw "No filename supplied"
    }

    if (Test-Path $file) {
       
        return write-host "File $file already exists" 

    } else {
        write-host "Creating file $file"
        New-Item -ItemType File -Path $file
    }

}