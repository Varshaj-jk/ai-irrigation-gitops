$ErrorActionPreference = "Continue"
$report = ".\security\cluster-audit.txt"

"AI Irrigation GitOps - Read-only audit" |
    Set-Content $report

function Add-Section {
    param([string]$Title, [string]$Command)
    "`r`n=== $Title ===" | Add-Content $report
    Invoke-Expression $Command 2>&1 |
        Out-String |
        Add-Content $report
}

Add-Section "Current context" "kubectl config current-context"
Add-Section "Kubernetes version" "kubectl version"
Add-Section "Nodes" "kubectl get nodes -o wide"
Add-Section "Namespaces" "kubectl get namespaces"
Add-Section "Argo CD applications" "kubectl get applications -n argocd"
Add-Section "Deployments" "kubectl get deployments -A"
Add-Section "Network policies" "kubectl get networkpolicies -A"
Add-Section "Pod security labels" "kubectl get namespaces --show-labels"

Write-Host "Audit report saved to $report"
