# Simple Schedule System in PowerShell

param (
    [string]$Day,
    [string]$Time,
    [string]$Subject
)

# Creating a variable to store the schedule
$Schedule = @{}

function Add-Class {
    param (
        [string]$Day,
        [string]$Time,
        [string]$Subject
    )
    if (-not $Schedule.ContainsKey($Day)) {
        $Schedule[$Day] = @{}
    }
    $Schedule[$Day][$Time] = $Subject
    Write-Output "Class added successfully!"
}

function Show-Schedule {
    if ($Schedule.Count -eq 0) {
        Write-Output "The schedule is empty."
        return
    }
    
    $html = "<html><head><title>Schedule</title></head><body><h1>Class Schedule</h1><table border='1'><tr><th>Day</th><th>Time</th><th>Subject</th></tr>"
    
    foreach ($Day in $Schedule.Keys) {
        foreach ($Time in $Schedule[$Day].Keys) {
            $html += "<tr><td>$Day</td><td>$Time</td><td>$($Schedule[$Day][$Time])</td></tr>"
        }
    }
    
    $html += "</table></body></html>"
    $html | Out-File -FilePath output\schedule.html
    Write-Output "Schedule saved to output\schedule.html"
}

# Ensure output directory exists
if (!(Test-Path -Path "output")) {
    New-Item -ItemType Directory -Path "output"
}

# Adding class from Jenkins parameters
if ($Day -and $Time -and $Subject) {
    Add-Class -Day $Day -Time $Time -Subject $Subject
}

# Generate schedule HTML file
Show-Schedule