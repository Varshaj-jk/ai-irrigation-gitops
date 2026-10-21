# AI Irrigation GitOps Security Checklist

## 1. Cluster baseline
- [ ] Identify Kubernetes distribution and version
- [ ] Select the matching CIS Kubernetes Benchmark
- [ ] Review authentication and API server configuration
- [ ] Review audit logging

## 2. Central administration
- [ ] Identify authorized administrators
- [ ] Review Kubernetes RBAC permissions
- [ ] Review Argo CD RBAC and SSO configuration
- [ ] Avoid shared administrator credentials

## 3. Application security
- [ ] Identify the irrigation application namespace
- [ ] Review service accounts and permissions
- [ ] Review container privileges and security contexts
- [ ] Review secrets management
- [ ] Review network policies and resource limits

## 4. GitOps governance
- [ ] Store approved manifests in Git
- [ ] Review changes before production deployment
- [ ] Validate Argo CD synchronization and health
- [ ] Record audit results and outstanding findings
