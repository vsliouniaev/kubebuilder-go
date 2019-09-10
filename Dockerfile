FROM golang:1.12-alpine

RUN apk --no-cache add curl \
    && curl -sL https://go.kubebuilder.io/dl/2.0.0/linux/amd64 | tar -xz -C /tmp/ \
    && mv /tmp/kubebuilder_2.0.0_linux_amd64 /usr/local/kubebuilder \
    && export PATH=$PATH:/usr/local/kubebuilder/bin \
    && curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest |\
       grep browser_download | grep linux | cut -d '"' -f 4 | xargs curl -O -L \
    && mv kustomize_*_linux_amd64 kustomize \
    && chmod u+x kustomize
