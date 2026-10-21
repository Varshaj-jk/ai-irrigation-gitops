
$ErrorActionPreference = "Continue"

New-Item -ItemType Directory -Force .\security\reports |
    Out-Null

$report = ".\security\reports\security-audit.txt"

"AI Irrigation GitOps - Read-only Security Audit" |
    Set-Content $report

function Add-AuditSection {
    param(
        [string]$Title,
        [string]$Command
    )

    "`r`n=== $Title ===" | Add-Content $report

    Invoke-Expression $Command 2>&1 |
        Out-String |
        Add-Content $report
}

Add-AuditSection "Current Context" `
    "kubectl config current-context"

Add-AuditSection "Kubernetes Version" `
    "kubectl version"

Add-AuditSection "Nodes" `
    "kubectl get nodes -o wide"

Add-AuditSection "Namespaces" `
    "kubectl get namespaces --show-labels"

Add-AuditSection "Argo CD Applications" `
    "kubectl get applications -n argocd"

Add-AuditSection "Deployments" `
    "kubectl get deployments -A"

Add-AuditSection "Pods" `
    "kubectl get pods -A"

Add-AuditSection "Network Policies" `
    "kubectl get networkpolicies -A"

Add-AuditSection "Argo CD RBAC ConfigMap" `
    "kubectl get configmap argocd-rbac-cm -n argocd -o yaml"

Write-Host "Audit report saved to $report"