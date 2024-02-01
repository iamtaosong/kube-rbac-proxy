# FROM gcr.io/distroless/static:nonroot

# ARG BINARY=kube-rbac-proxy-linux-amd64
# COPY _output/$BINARY /usr/local/bin/kube-rbac-proxy
# EXPOSE 8080
# USER 65532:65532

# ENTRYPOINT ["/usr/local/bin/kube-rbac-proxy"]

From gcr.io/kubebuilder/kube-rbac-proxy:v0.8.0  as  builder 
FROM gcr.io/distroless/static-debian11:nonroot

# ARG BINARY=kube-rbac-proxy-linux-amd64
# COPY _output/$BINARY /usr/local/bin/kube-rbac-proxy
COPY --from=builder /usr/local/bin/kube-rbac-proxy /usr/local/bin/kube-rbac-proxy
EXPOSE 8080
USER 65532:65532

ENTRYPOINT ["/usr/local/bin/kube-rbac-proxy"]
