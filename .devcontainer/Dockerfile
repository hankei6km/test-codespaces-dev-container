FROM ghcr.io/hankei6km/my-images-codespaces:basic

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
COPY --chown=vscode --chmod=755 mount-gd.sh /home/vscode/mount-gd.sh
USER vscode
RUN mkdir -p /home/vscode/gdrive \
    && test /home/vscode/.local/bin || mkdir -p /home/vscode/.local/bin \
    && mv /home/vscode/mount-gd.sh /home/vscode/.local/bin/mount-gd.sh
