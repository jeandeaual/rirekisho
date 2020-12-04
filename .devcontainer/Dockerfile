# Use the same image as the GitHub Action
FROM ghcr.io/xu-cheng/texlive-full:latest

# Create the "vscode" user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN addgroup -S -g "${USER_GID}" "${USERNAME}"
RUN adduser -S -s /bin/bash -u "${USER_UID}" -G "${USERNAME}" "${USERNAME}"

# Install some development tools
RUN apk update \
    && apk add --no-cache sudo git

# Make "vscode" a sudoer
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel
RUN sudo adduser "${USERNAME}" wheel

# Fix some TeXLive permission issue
# See https://tex.stackexchange.com/questions/571021/use-pandoc-latex-on-docker-with-lualatex-pdf-engine-and-tex-gyre-fonts
RUN chmod -R o+w /opt/texlive/texdir/texmf-var
