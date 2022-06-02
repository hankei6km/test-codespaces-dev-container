FROM ghcr.io/hankei6km/my-images-codespaces:basic

ARG USERNAME=vscode

USER root

RUN add-apt-repository -y ppa:alessandro-strada/ppa \
    && apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y google-drive-ocamlfuse \
    # clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    # setup gdfuse in global
    && sed -e 's/^#user_allow_other/user_allow_other/' -i /etc/fuse.conf


# setup gdfuse in user
COPY --chown="${USERNAME}" --chmod=755 mount-gd.sh "/home/${USERNAME}/mount-gd.sh"
USER vscode
RUN mkdir -p "/home/${USERNAME}/gdrive" \
    && test "/home/${USERNAME}/.local/bin" || mkdir -p "/home/${USERNAME}/.local/bin" \
    && mv "/home/${USERNAME}/mount-gd.sh" "/home/${USERNAME}/.local/bin/mount-gd.sh"
