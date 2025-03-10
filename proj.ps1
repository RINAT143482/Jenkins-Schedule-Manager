param (
    [string]$Day,
    [string]$Time,
    [string]$Subject
)

# Ensure output directory exists
if (!(Test-Path -Path "output")) {
    New-Item -ItemType Directory -Path "output"
}

# Check for missing parameters
if (-not $Day -or -not $Time -or -not $Subject) {
    Write-Output "Error: Missing parameters. Please provide Day, Time, and Subject."
    exit
}

# Create a schedule if all parameters are provided
$Schedule = @{}

if (-not $Schedule.ContainsKey($Day)) {
    $Schedule[$Day] = @{}
}

$Schedule[$Day][$Time] = $Subject

# Generate the HTML output
$html = @"
<html>
<head>
    <title>Schedule</title>
</head>
<body>
    <h1>Class Schedule</h1>
    <table border='1'>
        <tr><th>Day</th><th>Time</th><th>Subject</th></tr>
"@

foreach ($Day in $Schedule.Keys) {
    foreach ($Time in $Schedule[$Day].Keys) {
        $html += "<tr><td>$Day</td><td>$Time</td><td>$($Schedule[$Day][$Time])</td></tr>`n"
    }
}

$html += @"
    </table>
</body>
</html>
"@

# Save the schedule to HTML file
$html | Out-File -FilePath "output\schedule.html"

Write-Output "Schedule saved to output\schedule.html"

# Display the content of schedule.html in Jenkins Console
Write-Output "======= Schedule HTML Output ======="
Get-Content "output\schedule.html"
Write-Output "===================================="
