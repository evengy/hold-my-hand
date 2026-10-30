# Copilot preToolUse hook for file-editing tools. Asks the user before an edit to protected configuration.
# Reads the event JSON from stdin and writes exactly one JSON decision to stdout. Never runs tool input.
$ErrorActionPreference = 'Stop'
$ask = '{"permissionDecision":"ask","permissionDecisionReason":"Workspace policy: confirm this change to protected configuration."}'
$protected = '(^|/)(\.github/(copilot-instructions\.md$|agents/|instructions/|hooks/|workflows/|copilot/)|\.vscode/|\.devcontainer/|\.githooks/|\.husky/|\.claude/|\.git/hooks/|package\.json$)'

try {
    $toolArgs = ([Console]::In.ReadToEnd() | ConvertFrom-Json).toolArgs
    $paths = [System.Collections.Generic.List[string]]::new()
    $patch = $null
    if ($toolArgs -is [string]) {
        $patch = $toolArgs
    } elseif ($null -ne $toolArgs) {
        if ($toolArgs.path -is [string]) { $paths.Add($toolArgs.path) }
        if ($toolArgs.input -is [string]) { $patch = $toolArgs.input }
    }
    if ($null -ne $patch) {
        foreach ($match in [regex]::Matches($patch, '(?m)^\*\*\* (?:Add File|Update File|Delete File|Move to): (.+?)\s*$')) {
            $paths.Add($match.Groups[1].Value)
        }
    }

    # Ask when no target path can be identified, so an unknown argument shape never skips the check.
    $isProtected = $paths.Count -eq 0
    foreach ($path in $paths) {
        if (($path -replace '\\', '/') -match $protected) { $isProtected = $true }
    }
    if ($isProtected) { $ask } else { '{}' }
} catch {
    $ask
}
