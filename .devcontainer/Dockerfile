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
    && sudo sed -e 's/^#user_allow_other/user_allow_other/' -i /etc/fuse.conf \
    # && echo -e '#!/bin/sh\necho $* > /dev/stderr' > /bin/firefox \
    # && chmod 777 /bin/firefox \
    && mkdir -p /mnt/GooglePrivate \
    && chmod 777 /mnt/GooglePrivate

# setup gdfuse in user
USER vscode
RUN mkdir -p /home/vscode/.gdfuse/GooglePrivate
